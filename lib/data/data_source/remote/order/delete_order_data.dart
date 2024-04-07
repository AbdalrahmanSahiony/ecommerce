import 'package:flutter_application_19/core/classes/curd.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';

class DeleteOrderData {
  Curd curd;
  DeleteOrderData(this.curd);
  orderDeleteData(String orderId) async {
    var response = await curd.postRequest(AppLink.orderDelete, {
      "orderId": orderId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
