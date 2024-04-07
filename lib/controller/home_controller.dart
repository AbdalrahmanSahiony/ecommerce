import 'package:flutter_application_19/data/model/items_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/controller/search_mix_controller.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/core/servecies/servecies.dart';
import 'package:flutter_application_19/view/secreens/items.dart';

abstract class HomeController extends SearchMixController {
  initData();
  getData();
  goToItems(List categories, selectedCat, String categoryId);
  goToFavourite();
  goToItemsDetails(details);
}

class HomeControllerIm extends HomeController {
  MyServecies myServecies = MyServecies();
  String? id;
  String? userName;
  List categories = [];
  List items = [];
  List data = [];
  List<ItemsModel> itemsTopSelling = [];
  Map setting = {};
  @override
  getData() async {
    stateRequest = ConectionState.loading;
    update();
    var response = await homeData.getHomeData();
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        categories.addAll(response["categories"]);
        items.addAll(response["items"]);
        data.addAll(response["top_selling"]);
        itemsTopSelling.addAll(data.map((e) => ItemsModel.fromJson(e)));
        setting = response["setting"];
      }
    }
    update();
  }

  @override
  initData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences.getString("id");
    userName = sharedPreferences.getString("name");
  }

  @override
  void onInit() async {
    await initData();
    await getData();
    super.onInit();
  }

  @override
  goToItems(List categories, selectedCat, categoryId) {
    Get.to(() => const Item(), arguments: {
      "categories": categories,
      "slectedCat": selectedCat,
      "categoryId": categoryId
    });
  }

  @override
  goToFavourite() {
    Get.toNamed("favourite");
  }

  @override
  goToItemsDetails(details) {
    Get.toNamed("/itemsDetails", arguments: {
      "details": details,
    });
  }
}
