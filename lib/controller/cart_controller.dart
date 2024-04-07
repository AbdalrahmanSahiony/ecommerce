import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/core/constans/routesString.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/core/servecies/servecies.dart';
import 'package:flutter_application_19/data/data_source/remote/cart_data.dart';
import 'package:flutter_application_19/data/model/cart_model.dart';
import 'package:flutter_application_19/data/model/coupon_model.dart';

class CartController extends GetxController {
  ConectionState stateRequest = ConectionState.none;
  CartData cartData = CartData(Get.find());
  String? id = MyServecies.sharedPreferences.getString("id");
  List data = [];
  String? couponId;
  String? orderPrice;
  int t = 0;
  double totalPrice = 0;
  String? couponName;
  List prices = [];
  List<CartModel> cart = [];
  TextEditingController couponController = TextEditingController();
  CouponModel? couponModel;
  int discount = 0;
  double? totalPriceWithCoupon;

  viewAllCart() async {
    stateRequest = ConectionState.loading;
    update();
    var response = await cartData.viewAllCart(id!);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        data = response["data"];
        cart.addAll(data.map((e) => CartModel.fromJson(e)));
        // total price calc
        for (int i = 0; i < data.length; i++) {
          double s = data[i]["items_price"] -
              (data[i]["items_price"] * data[i]["items_discount"]) / 100;
          totalPrice = s * data[i]["cart_item_count"];
          prices.add(totalPrice);
        }
        totalPrice = prices.reduce((value, element) => value + element);
        update();
      }
      update();
    }
  }

  getCoubonData() async {
    stateRequest = ConectionState.loading;
    update();
    var response = await cartData.getCouponData(couponController.text);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        Map<String, dynamic> data = response["data"];
        couponModel = CouponModel.fromJson(data);
        discount = couponModel!.couponDiscount!;
        couponName = couponModel!.couponName;
        couponId = couponModel!.coupunId.toString();
      } else {
        Get.defaultDialog(
          title: "alert",
          middleText: "the coupon not found",
        );
        discount = 0;
        couponName = null;
        couponId = null;
      }
      update();
    }
  }

  totalPriceCalc() {
    totalPriceWithCoupon = totalPrice - (totalPrice * discount) / 100;
    return totalPrice - (totalPrice * discount) / 100;
  }

  goToCheckout() {
    if (data.isEmpty) {
      Get.snackbar("alert", "the cart is empty");
    } else {
      Get.toNamed(AppRoutes.checkout, arguments: {
        "couponId": couponId ?? "0",
        "orderPrice": totalPriceWithCoupon == null
            ? totalPrice.toString()
            : totalPriceWithCoupon.toString(),
        "cart": data,
      });
    }
  }

  @override
  void onInit() {
    viewAllCart();
    super.onInit();
  }
}
