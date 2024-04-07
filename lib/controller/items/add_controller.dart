import 'dart:io';

import 'package:admin/connection_state.dart';
import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/app_routes_string.dart';
import 'package:admin/core/function/handling_data.dart';
import 'package:admin/data/categories_data.dart';
import 'package:admin/data/items_data.dart';
import 'package:admin/data/model/categories_model.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ItemsAddController extends GetxController {
  TextEditingController? name;
  TextEditingController? nameAr;
  TextEditingController? descrebtion;
  TextEditingController? descrebtionAr;
  TextEditingController? price;
  TextEditingController? discount;
  TextEditingController idList = TextEditingController();
  TextEditingController nameList = TextEditingController();
  ConectionState stateRequest = ConectionState.none;
  List<SelectedListItem> dropListItems = [];
  ItemsData itemsData = ItemsData(Get.find());
  File? file;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  uploadFile([isSvg = false]) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: isSvg
            ? ["svg", "SVG"]
            : ["png", "PNG", "jpg", "JPG", "jpeg", "JPEG", "gif", "GIF"]);
    if (result != null) {
      return File(result.files.single.path!);
    } else {
      return null;
    }
  }

  uploadImageFromCamer() async {
    final XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 90);
    if (file != null) {
      return File(file.path);
    } else {
      return null;
    }
  }

  choseImage() async {
    file = await uploadFile(false);
    update();
  }

  choseImageCamera() async {
    file = await uploadImageFromCamer();
    update();
  }

  bool validit() {
    var formdat = key.currentState;
    if (formdat!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  addcItems() async {
    if (file == null) {
      Get.snackbar("Error", "please select image");
      return;
    }
    stateRequest = ConectionState.loading;
    update();
    var response = await itemsData.addData({
      "name": name!.text,
      "name_ar": nameAr!.text,
      "desc": descrebtion!.text,
      "desc_ar": descrebtionAr!.text,
      "price": price!.text,
      "discount": discount!.text,
      "item_categories": idList.text,
    }, file);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        Get.snackbar("alert", "your item is added");
        Get.offAllNamed(AppRoutesString.itemsView);
        ItemsViewController c = Get.find();
        c.getItems();
      } else {
        stateRequest = ConectionState.failure;
      }
    }
    update();
  }

  getcategories() async {
    List data = [];
    List<CategorisModel> categories = [];
    CategorisData categorisData = CategorisData(Get.find());
    update();
    stateRequest = ConectionState.loading;
    update();
    var response = await categorisData.viewData();
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        data.addAll(response["data"]);
        categories.addAll(data.map((e) => CategorisModel.fromJson(e)));
        for (int i = 0; i < categories.length; i++) {
          dropListItems.add(SelectedListItem(
              name: categories[i].categoriesName.toString(),
              value: categories[i].categoriesId.toString()));
        }
      } else {}
    }
    update();
  }

  @override
  void onInit() {
    getcategories();
    name = TextEditingController();
    nameAr = TextEditingController();
    descrebtion = TextEditingController();
    descrebtionAr = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    super.onInit();
  }
}
