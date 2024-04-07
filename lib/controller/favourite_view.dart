import 'package:get/get.dart';
import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/core/servecies/servecies.dart';
import 'package:flutter_application_19/data/data_source/remote/favourite_data.dart';
import 'package:flutter_application_19/data/data_source/remote/favourite_view_data.dart';
import 'package:flutter_application_19/data/model/favourit_mdel.dart';

abstract class FavouritViewController extends GetxController {
  viewFavourit();
}

class FavouritViewControllerImp extends FavouritViewController {
  MyServecies myServecies = MyServecies();
  String? userId = MyServecies.sharedPreferences.getString("id");
  FavouriteViewData favouriteViewData = FavouriteViewData(Get.find());
  FavouriteData favouriteData = FavouriteData(Get.find());
  ConectionState stateRequest = ConectionState.none;
  List<FavouriteModel> myFavourite = [];

  @override
  viewFavourit() async {
    myFavourite.clear();
    stateRequest = ConectionState.loading;
    update();
    var response = await favouriteViewData.viewFavourite(userId!);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        List responseDat = response["data"];
        myFavourite.addAll(responseDat.map((e) => FavouriteModel.fromJson(e)));
        update();
      }
    }
    update();
  }

  deleteFavId(id) {
    favouriteData.deleteFavId(id);
    myFavourite.removeWhere((element) => element.favouriteId == id);
    update();
  }

  @override
  void onInit() {
    viewFavourit();
    super.onInit();
  }
}
