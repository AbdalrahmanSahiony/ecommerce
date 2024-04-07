import 'package:delivery/core/classes/curd.dart';
import 'package:delivery/core/const/app_link.dart';

class ApproveOrder {
  Curd curd;
  ApproveOrder(this.curd);
  approve(orderId, deliveryId, userId) async {
    var response = await curd.postRequest(AppLink.approve,
        {"orderId": orderId, "deliveryId": deliveryId, "userId": userId});
    return response.fold((l) => l, (r) => r);
  }
}
