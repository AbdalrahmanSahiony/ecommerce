import 'package:flutter_application_19/core/classes/curd.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';

class OrderData {
  Curd curd;
  OrderData(this.curd);
  pindingOrdersData(String userId) async {
    var response = await curd.postRequest(AppLink.pindingOrders, {
      "userId": userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  archiveOrdersData(String userId) async {
    var response = await curd.postRequest(AppLink.archiveOrders, {
      "userId": userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
