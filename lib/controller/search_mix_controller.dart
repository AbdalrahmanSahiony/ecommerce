import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/data/data_source/remote/home_data.dart';
import 'package:flutter_application_19/data/model/items_model.dart';

class SearchMixController extends GetxController {
  HomeData homeData = HomeData(Get.find());
  List responseData = [];
  List<ItemsModel> searchItems = [];
  TextEditingController serchController = TextEditingController();
  ConectionState stateRequest = ConectionState.none;
  double? price;
  List<double> priceDiscount = [];
  bool isSearch = false;
  changeSearchState(val) {
    if (val == "") {
      isSearch = false;
      update();
    }
  }

  search() {
    isSearch = true;
    update();
    getSerchData();
  }

  getSerchData() async {
    searchItems.clear();
    update();
    stateRequest = ConectionState.loading;
    update();
    var response = await homeData.searchData(serchController.text);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        responseData = response["data"];
        searchItems.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
        for (int i = 0; i < responseData.length; i++) {
          price = responseData[i]["items_price"] -
              (responseData[i]["items_price"] *
                  (responseData[i]["items_discount"] / 100));
          priceDiscount.add(price!);
        }

        update();
      } else {
        stateRequest = ConectionState.failure;
        update();
      }
    }

    update();
  }

  serchFalse() {
    if (isSearch) {
      isSearch = false;
    } else {
      exit(0);
    }
    update();
  }
}
