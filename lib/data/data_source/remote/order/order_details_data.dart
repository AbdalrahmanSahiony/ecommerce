import 'package:flutter_application_19/core/classes/curd.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';

class OrderDetailsViewData {
  Curd curd;
  OrderDetailsViewData(this.curd);
  orderDetailsData(String orderId) async {
    var response = await curd.postRequest(AppLink.orderDetailsView, {
      "orderId": orderId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
