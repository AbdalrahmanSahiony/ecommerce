import 'package:admin/connection_state.dart';
import 'package:admin/core/app_routes_string.dart';

import 'package:admin/core/function/handling_data.dart';
import 'package:admin/data/model/order_model.dart';
import 'package:admin/data/order_data.dart';
import 'package:get/get.dart';

class ApprovedOrderContnroller extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());
  String? id;
  String? userName;
  List data = [];
  List<OrdersModel> approvedOrder = [];
  ConectionState stateRequest = ConectionState.none;

  getApprovedOrders() async {
    data.clear();
    update();
    approvedOrder.clear();
    update();
    stateRequest = ConectionState.loading;
    update();
    var response = await ordersData.apprvedOrdersView();
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        data.addAll(response["data"]);
        update();
        approvedOrder.addAll(data.map((e) => OrdersModel.fromJson(e)));
        update();
      } else {
        stateRequest = ConectionState.failure;
      }
    }
    update();
  }

  doneOrdr(String userId, String orderId, String orderType) async {
    stateRequest = ConectionState.loading;
    update();
    var response = await ordersData.doneData(userId, orderId, orderType);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        getApprovedOrders();
        update();
      }
    }
  }

  goToDetails(OrdersModel order) {
    Get.toNamed(AppRoutesString.details, arguments: {"order": order});
  }

  @override
  void onInit() {
    getApprovedOrders();
    super.onInit();
  }
}
