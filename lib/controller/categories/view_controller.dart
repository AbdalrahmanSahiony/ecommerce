import 'package:admin/connection_state.dart';
import 'package:admin/core/app_routes_string.dart';
import 'package:admin/core/function/handling_data.dart';
import 'package:admin/data/categories_data.dart';
import 'package:admin/data/model/categories_model.dart';

import 'package:get/get.dart';

class CategoriesViewController extends GetxController {
  ConectionState stateRequest = ConectionState.none;
  CategorisData categorisData = CategorisData(Get.find());
  List data = [];
  List<CategorisModel> categories = [];
  getcategories() async {
    data.clear();
    update();
    stateRequest = ConectionState.loading;
    update();
    var response = await categorisData.viewData();
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        data.addAll(response["data"]);
        categories.addAll(data.map((e) => CategorisModel.fromJson(e)));
      } else {}
    }
    update();
  }

  deletecategories(id, img) async {
    stateRequest = ConectionState.loading;
    update();
    var response = await categorisData.deleteData(id, img);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        data.removeWhere((element) => "${element["categories_id"]}" == id);
        Get.snackbar("alert", "the categori removed");
      } else {
        stateRequest = ConectionState.failure;
      }
    }
    update();
  }

  goToAddcategories() {
    Get.toNamed(AppRoutesString.addcategories);
  }

  removecategories(id, img) {
    Get.defaultDialog(
        title: "Warning",
        middleText: "Are sure that you want remove this categories",
        onCancel: () {},
        onConfirm: () {
          deletecategories(id, img);
          Get.back();
        });
  }

  goToEditcategories(categoriesModel) {
    Get.toNamed(AppRoutesString.editCategoris,
        arguments: {"categories": categoriesModel});
  }

  @override
  void onInit() {
    getcategories();
    super.onInit();
  }
}
