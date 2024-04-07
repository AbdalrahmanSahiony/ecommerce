import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/controller/search_mix_controller.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/data/data_source/remote/offres_data.dart';
import 'package:flutter_application_19/data/model/items_model.dart';
import 'package:get/get.dart';

class OffersViewController extends SearchMixController {
  OffersData offersData = OffersData(Get.find());
  List data = [];
  List prices = [];
  List<ItemsModel> offerItems = [];
  getItemsOffers() async {
    data.clear();
    update();
    stateRequest = ConectionState.loading;
    update();
    var response = await offersData.offersViewData();

    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        data.addAll(response["data"]);
        offerItems.addAll(data.map((e) => ItemsModel.fromJson(e)));
        update();
        for (int i = 0; i < data.length; i++) {
          double s = data[i]["items_price"] -
              (data[i]["items_price"] * data[i]["items_discount"]) / 100;
          prices.add(s);
        }
      } else {
        stateRequest = ConectionState.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getItemsOffers();
    super.onInit();
  }

  void goToFavourite() {
    Get.toNamed("/favourite");
  }
}
