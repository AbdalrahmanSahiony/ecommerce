import 'package:flutter_application_19/core/classes/curd.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';

class CartData {
  Curd curd;
  CartData(this.curd);
  addCart(String userId, String itemId) async {
    var response = await curd.postRequest(
        AppLink.addCart, {"user_id": userId, "favourite_itemsid": itemId});
    return response.fold((l) => l, (r) => r);
  }

  removeCart(String userId, String itemId) async {
    var response = await curd.postRequest(
        AppLink.deleteCart, {"user_id": userId, "favourite_itemsid": itemId});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String userId, String itemId) async {
    var response = await curd.postRequest(
        AppLink.viewCart, {"user_id": userId, "favourite_itemsid": itemId});
    return response.fold((l) => l, (r) => r);
  }

  viewAllCart(String id) async {
    var response = await curd.postRequest(AppLink.viewAllCart, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  getCouponData(String couponName) async {
    var response =
        await curd.postRequest(AppLink.checkCoupon, {"name": couponName});
    return response.fold((l) => l, (r) => r);
  }
}
