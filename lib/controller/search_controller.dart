import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/data/data_source/remote/search_data.dart';
import 'package:flutter_application_19/data/model/items_model.dart';

class SearchControllerI extends GetxController {
  bool isSearch = false;
  ConectionState stateRequest = ConectionState.none;
  List<ItemsModel> searchItems = [];
  TextEditingController serchController = TextEditingController();
  SerchData serchData = SerchData(Get.find());
  changeSearchState(val) {
    if (val == "") {
      isSearch = false;
      update();
    }
  }

  search() {
    isSearch = true;
    getSerchData();
    update();
  }

  getSerchData() async {
    searchItems.clear();
    update();
    stateRequest = ConectionState.loading;
    update();
    var response = await serchData.searchData(serchController.text);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        List responseData = response["data"];
        searchItems.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
        update();
      } else {
        stateRequest = ConectionState.failure;
        update();
      }
    }
    update();
  }
}
