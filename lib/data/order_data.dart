import 'package:admin/core/classes/curd.dart';
import 'package:admin/core/constant/app_link.dart';

class OrdersData {
  Curd curd;
  OrdersData(this.curd);
  pindingView() async {
    var response = await curd.postRequest(AppLink.pendingView, {});
    return response.fold((l) => l, (r) => r);
  }

  approve(String userId, String orderId) async {
    var response = await curd.postRequest(AppLink.approved, {
      "userId": userId,
      "orderId": orderId,
    });
    return response.fold((l) => l, (r) => r);
  }

  apprvedOrdersView() async {
    var response = await curd.postRequest(AppLink.approvedView, {});
    return response.fold((l) => l, (r) => r);
  }

  detailsData(orderId) async {
    var response =
        await curd.postRequest(AppLink.details, {"order_id": orderId});
    return response.fold((l) => l, (r) => r);
  }

  doneData(String userId, String orderId, String orderType) async {
    var response = await curd.postRequest(AppLink.done,
        {"userId": userId, "orderId": orderId, "orderType": orderType});
    return response.fold((l) => l, (r) => r);
  }

  archive() async {
    var response = await curd.postRequest(AppLink.archive, {});
    return response.fold((l) => l, (r) => r);
  }
}
