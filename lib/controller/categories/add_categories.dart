import 'dart:io';

import 'package:admin/connection_state.dart';
import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/app_routes_string.dart';
import 'package:admin/core/function/handling_data.dart';
import 'package:admin/data/categories_data.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CategoriesAddController extends GetxController {
  TextEditingController? name;
  TextEditingController? nameAr;
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

  addCategories() async {
    if (file == null) {
      Get.snackbar("Error", "please select image");
      return;
    }
    stateRequest = ConectionState.loading;
    update();
    var response = await categorisData
        .addData({"name": name!.text, "name_ar": nameAr!.text}, file);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        Get.snackbar("alert", "your categories is added");
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
    name = TextEditingController();
    nameAr = TextEditingController();
    super.onInit();
  }
}
