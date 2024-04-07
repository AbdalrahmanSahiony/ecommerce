import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/core/servecies/servecies.dart';
import 'package:flutter_application_19/data/data_source/remote/favourite_data.dart';

abstract class FavouriteController extends GetxController {}

class FavouriteControllerImp extends FavouriteController {
  Map isFavourite = {};
  MyServecies myServecies = Get.find();
  String? userId = MyServecies.sharedPreferences.getString("id");
  setFavourite(id, val) {
    isFavourite[id] = val;
    update();
  }

  ConectionState stateRequest = ConectionState.none;
  FavouriteData favouriteData = FavouriteData(Get.find());
  addFavourite(itemId) async {
    stateRequest = ConectionState.loading;
    update();
    var response = await favouriteData.addFavourite(userId!, itemId);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        Get.rawSnackbar(
            title: "alert", messageText: const Text("the items aded"));
      }
    }
  }

  removeFavourite(itemId) async {
    stateRequest = ConectionState.loading;
    update();
    var response = await favouriteData.removeFavourite(userId!, itemId);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        Get.rawSnackbar(
            title: "alert", messageText: const Text("the items removed"));
      }
    }
  }
}
