import 'package:admin/connection_state.dart';
import 'package:admin/core/app_routes_string.dart';

import 'package:admin/core/function/handling_data.dart';
import 'package:admin/data/model/order_model.dart';
import 'package:admin/data/order_data.dart';
import 'package:get/get.dart';

class PindingOrdersController extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());
  String? id;
  String? userName;
  List data = [];
  List<OrdersModel> pindingOrder = [];
  ConectionState stateRequest = ConectionState.none;

  getPindingsOrders() async {
    stateRequest = ConectionState.loading;
    update();
    var response = await ordersData.pindingView();
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        data.addAll(response["data"]);
        update();
        pindingOrder.addAll(data.map((e) => OrdersModel.fromJson(e)));
        update();
      } else {
        stateRequest = ConectionState.failure;
      }
    }
    update();
  }

  goToDetails(OrdersModel order) {
    Get.toNamed(AppRoutesString.details, arguments: {"order": order});
  }

  approveOrder(userId, orderId) async {
    data.clear();
    update();
    pindingOrder.clear();
    update();
    stateRequest = ConectionState.loading;
    update();
    var response = await ordersData.approve(userId, orderId);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        Get.snackbar("alert", "The order has been aprroved");
        getPindingsOrders();
      }
    }
  }

  paymantWayPrint(String val) {
    if (val == "0") {
      return "Cash";
    } else {
      return "Payment Card";
    }
  }

  @override
  void onInit() {
    getPindingsOrders();
    super.onInit();
  }
}
