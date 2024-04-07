import 'package:admin/connection_state.dart';
import 'package:admin/core/app_routes_string.dart';
import 'package:admin/core/function/handling_data.dart';
import 'package:admin/data/items_data.dart';
import 'package:admin/data/model/items_model.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

class ItemsViewController extends GetxController {
  ConectionState stateRequest = ConectionState.none;
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  List dataSercg = [];
  List<ItemsModel> itemSerch = [];
  List<ItemsModel> items = [];
  TextEditingController search = TextEditingController();
  bool isSearch = false;
  getItems() async {
    data.clear();
    update();
    stateRequest = ConectionState.loading;
    update();
    var response = await itemsData.viewData();
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        data.addAll(response["data"]);
        items.addAll(data.map((e) => ItemsModel.fromJson(e)));
      } else {
        stateRequest = ConectionState.failure;
      }
    }
    update();
  }

  serchFalse() {
    if (isSearch) {
      isSearch = false;
      search.clear();
      update();
    } else {
      Get.back();
    }
  }

  serrchState(String val) {
    if (val.isEmpty) {
      isSearch = false;
      update();
    }
  }

  deletecategories(id, img) async {
    stateRequest = ConectionState.loading;
    update();
    var response = await itemsData.deleteData(id, img);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        data.removeWhere((element) => "${element["items_id"]}" == id);
        dataSercg.removeWhere((element) => "${element["items_id"]}" == id);
        Get.snackbar("alert", "the item removed");
      } else {
        stateRequest = ConectionState.failure;
      }
    }
    update();
  }

  serchItems() async {
    isSearch = true;
    update();
    stateRequest = ConectionState.loading;
    update();
    var response = await itemsData.serchData(search.text);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        dataSercg.addAll(response["data"]);
        itemSerch.addAll(dataSercg.map((e) => ItemsModel.fromJson(e)));
      } else {
        stateRequest = ConectionState.failure;
      }
    }
    update();
  }

  goToEditItem(ItemsModel items) {
    Get.toNamed(AppRoutesString.itemsEdit, arguments: {"item": items});
  }

  goToAddItem() {
    Get.toNamed(AppRoutesString.itemsAdd);
  }

  removeItems(id, img) {
    Get.defaultDialog(
        title: "Warning",
        middleText: "Are sure that you want remove this categories",
        onCancel: () {},
        onConfirm: () {
          deletecategories(id, img);
          Get.back();
        });
  }

  @override
  void onInit() {
    getItems();
    super.onInit();
  }
}
