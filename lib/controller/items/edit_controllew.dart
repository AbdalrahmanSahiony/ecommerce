import 'dart:io';
import 'package:admin/connection_state.dart';
import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/app_routes_string.dart';
import 'package:admin/core/function/handling_data.dart';
import 'package:admin/data/items_data.dart';
import 'package:admin/data/model/items_model.dart';
import 'package:admin/data/model/order_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ItemsEditController extends GetxController {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController? name;
  TextEditingController? nameAr;
  TextEditingController? descrebtion;
  TextEditingController? descrebtionAr;
  TextEditingController? price;
  TextEditingController? discount;
  late ItemsModel itemsModel;
  String active = "1";
  ConectionState stateRequest = ConectionState.none;
  ItemsData itemsData = ItemsData(Get.find());
  File? file;
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

  activeAndHideItem(value) {
    active = value;

    update();
  }

  goToDetails(OrdersModel order) {
    Get.toNamed(AppRoutesString.details, arguments: {"order": order});
  }

  editItem() async {
    stateRequest = ConectionState.loading;
    update();
    var response = await itemsData.editData({
      "id": itemsModel.itemsId.toString(),
      "name": name!.text,
      "name_ar": nameAr!.text,
      "img_old": itemsModel.itemsImage.toString(),
      "desc": descrebtion!.text,
      "desc_ar": descrebtionAr!.text,
      "price": price!.text,
      "discount": discount!.text,
      "active": active,
    }, file);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        goToItemsView();
        ItemsViewController c = Get.find();
        c.getItems();
      } else {
        stateRequest = ConectionState.failure;
      }
    }
    update();
  }

  goToItemsView() {
    Get.offAllNamed(AppRoutesString.itemsView);
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

  @override
  void onInit() {
    itemsModel = Get.arguments["item"];
    name = TextEditingController();
    descrebtion = TextEditingController();
    nameAr = TextEditingController();
    descrebtion = TextEditingController();
    descrebtionAr = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    name!.text = itemsModel.itemsName!;
    nameAr!.text = itemsModel.itemsNameAr!;
    descrebtion!.text = itemsModel.itemsDescreption!;
    descrebtionAr!.text = itemsModel.itemsDescreptionAr!;
    price!.text = itemsModel.itemsPrice.toString();
    discount!.text = itemsModel.itemsDiscount.toString();
    super.onInit();
  }
}
