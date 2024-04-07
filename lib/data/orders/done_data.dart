import 'package:delivery/core/classes/curd.dart';
import 'package:delivery/core/const/app_link.dart';

class DoneOrder {
  Curd curd;
  DoneOrder(this.curd);
  done(orderId, deliveryId, userId) async {
    var response = await curd.postRequest(AppLink.doneOrders,
        {"orderId": orderId, "deliveryId": deliveryId, "userId": userId});
    return response.fold((l) => l, (r) => r);
  }
}
