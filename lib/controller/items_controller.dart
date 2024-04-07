import 'package:get/get.dart';
import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/controller/search_mix_controller.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/core/servecies/servecies.dart';
import 'package:flutter_application_19/data/data_source/remote/item_data.dart';

abstract class ItemsController extends SearchMixController {
  initData();
  changeCat(val);
  getItems(String categoryId);
  goToItemsDetails(details);
  isSearchFalse();
}

class ItemsControllerImp extends ItemsController {
  MyServecies myServecies = Get.find();
  String? userId;
  List categories = [];
  List items = [];
  String? categoryId;
  int? selectedCat;
  ItemData itemData = ItemData(Get.find());
  @override
  initData() {
    userId = MyServecies.sharedPreferences.getString("id");
    categories = Get.arguments["categories"];
    selectedCat = Get.arguments["slectedCat"];
    categoryId = Get.arguments["categoryId"];
  }

  @override
  void onInit() {
    initData();
    getItems(categoryId!);
    super.onInit();
  }

  @override
  changeCat(val) {
    selectedCat = val;
    isSearch = false;

    update();
  }

  @override
  getItems(categoryId) async {
    items.clear();
    stateRequest = ConectionState.loading;
    update();
    var response = await itemData.getItemData(categoryId, userId!.toString());
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succer") {
        items.addAll(response["data"]);
      }
    }

    update();
  }

  @override
  goToItemsDetails(details) {
    Get.toNamed("/itemsDetails", arguments: {
      "details": details,
    });
  }

  @override
  isSearchFalse() {
    if (isSearch) {
      isSearch = false;
      update();
    } else {
      Get.back();
    }
  }
}
