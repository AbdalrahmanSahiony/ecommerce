import 'package:get/get.dart';
import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/core/servecies/servecies.dart';
import 'package:flutter_application_19/data/data_source/remote/cart_data.dart';
import 'package:flutter_application_19/data/model/items_model.dart';

abstract class ItemsDetails extends GetxController {
  initData();
  goToCart();
}

class ItemsDetailsImp extends ItemsDetails {
  late ItemsModel details;
  ConectionState stateRequest = ConectionState.none;
  CartData cartData = CartData(Get.find());
  List cart = [];
  int i = 0;
  var userId = MyServecies.sharedPreferences.getString("id");
  double priceWithDiscount = 0;

  addCart(userId, itemId) async {
    stateRequest = ConectionState.loading;
    update();
    var response = await cartData.addCart(userId!, itemId);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        if (cart.isNotEmpty) {
          i++;
        }
        cart.addAll(response["data"]);
      }
    }
    update();
  }

  removeCart(userId, itemId) async {
    stateRequest = ConectionState.loading;
    update();
    var response = await cartData.removeCart(userId, itemId);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        if (cart.isNotEmpty) {
          i++;
        }
        cart.addAll(response["data"]);
      }
      if (response["status"] == "fail") {
        cart.clear();
        i = 0;
      }
    }
    update();
  }

  viewCart(userId, itemId) async {
    cart.clear();
    stateRequest = ConectionState.loading;
    update();
    var response = await cartData.viewCart(userId, itemId);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        cart.addAll(response["data"]);
      }
    }
    update();
  }

  priceWithDiscountCalc() {
    priceWithDiscount = details.itemsPrice! -
        (details.itemsPrice! * (details.itemsDiscount! / 100));
  }

  List clorContainers = [
    {"name": "red", "id": "1", "active": true},
    {"name": "blue", "id": "2", "active": false},
    {"name": "green", "id": "3", "active": false}
  ];
  @override
  void onInit() {
    initData();

    super.onInit();
  }

  @override
  initData() {
    details = Get.arguments["details"];
    viewCart(userId, details.itemsId.toString());
    priceWithDiscountCalc();
  }

  @override
  goToCart() {
    Get.toNamed("cart", arguments: {"priceWithDiscount": priceWithDiscount});
  }
}
