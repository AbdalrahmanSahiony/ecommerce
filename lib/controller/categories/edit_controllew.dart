import 'dart:io';
import 'package:admin/connection_state.dart';
import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/app_routes_string.dart';
import 'package:admin/core/function/handling_data.dart';
import 'package:admin/data/categories_data.dart';
import 'package:admin/data/model/categories_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CategoriesEditController extends GetxController {
  TextEditingController? name;
  TextEditingController? nameAr;
  late CategorisModel categorisModel;
  ConectionState stateRequest = ConectionState.none;
  CategorisData categorisData = CategorisData(Get.find());
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

  choseImage() async {
    file = await uploadFile(true);
    update();
  }

  editcategories() async {
    stateRequest = ConectionState.loading;
    update();
    var response = await categorisData.editData({
      "id": categorisModel.categoriesId.toString(),
      "name": name!.text,
      "name_ar": nameAr!.text,
      "img_old": categorisModel.categoriesImage.toString()
    }, file);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        Get.offAllNamed(AppRoutesString.categorisView);
        CategoriesViewController c = Get.find();
        c.getcategories();
      } else {
        stateRequest = ConectionState.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    categorisModel = Get.arguments["categories"];
    name = TextEditingController();
    nameAr = TextEditingController();
    super.onInit();
  }
}
