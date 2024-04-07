import 'package:get/get.dart';
import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/core/constans/routesString.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/core/servecies/servecies.dart';
import 'package:flutter_application_19/data/data_source/remote/address_data.dart';
import 'package:flutter_application_19/data/data_source/remote/checkout_data.dart';
import 'package:flutter_application_19/data/model/address_model.dart';

class CheckOutController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  CheckoutData checkoutData = CheckoutData(Get.find());
  String? id = MyServecies.sharedPreferences.getString("id");
  List data = [];
  List<AddressModel> addressModel = [];
  ConectionState stateRequest = ConectionState.none;
  String? deliveryWay;
  String? paymentyWay;
  String? addres;
  List? cart;
  late String couponId;
  late String orderPrice;
  chosepaymentWay(String val) {
    paymentyWay = val;
    update();
  }

  choseDeliverWay(String val) {
    deliveryWay = val;
    update();
  }

  choseYourAddress(String val) {
    addres = val;
    update();
  }

  viewAdress() async {
    data.clear();
    update();
    addressModel.clear();
    update();
    var response = await addressData.viewAddress(id!);
    stateRequest = handlingData(response);
    if (response["status"] == "succes") {
      data = response["data"];
      addressModel.addAll(data.map((e) => AddressModel.fromJson(e)));
      update();
    }

    update();
  }

  checkout() async {
    if (cart!.isEmpty) {
      Get.snackbar("alert", "your cart is empty");
      return;
    }
    if (paymentyWay == null) {
      Get.snackbar("alert", "chose your payyment way");
      return;
    }
    if (deliveryWay == null) {
      Get.snackbar("alert", "chose your delivery way ");
      return;
    }
    if (deliveryWay == "0" && addres == null) {
      Get.snackbar("alert", "chose your address");
      return;
    }
    stateRequest = ConectionState.loading;
    update();
    Map<String, dynamic> data = {
      "userId": id,
      "addressId": deliveryWay == "0" ? addres : "0",
      "addressPrice": orderPrice,
      "orderType": deliveryWay,
      "couponId": couponId,
      "deliveryPrice": "0",
      "paymentWay": paymentyWay,
    };

    var response = await checkoutData.checkout(data);
    stateRequest = handlingData(response);
    if (response["status"] == "succes") {
      Get.offAllNamed(AppRoutes.home);
      cart!.clear();
      Get.snackbar("alert", "your order is being prepared");
    }
  }

  goToAddAddress() {
    Get.toNamed(AppRoutes.addAddress);
  }

  @override
  void onInit() {
    viewAdress();
    orderPrice = Get.arguments["orderPrice"];
    couponId = Get.arguments["couponId"];
    cart = Get.arguments["cart"];
    super.onInit();
  }
}
