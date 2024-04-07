import 'package:flutter_application_19/core/constans/routesString.dart';
import 'package:flutter_application_19/data/data_source/remote/order/delete_order_data.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/core/servecies/servecies.dart';
import 'package:flutter_application_19/data/data_source/remote/order/order.dart';
import 'package:flutter_application_19/data/model/orders_model.dart';

class PindingOrdersController extends GetxController {
  OrderData orderData = OrderData(Get.find());
  DeleteOrderData deleteOrderData = DeleteOrderData(Get.find());
  String? id;
  String? userName;
  List categories = [];
  List data = [];
  List<OrdersModel> pindingOrder = [];
  ConectionState stateRequest = ConectionState.none;

  getPindingsOrders() async {
    data.clear();
    update();
    pindingOrder.clear();
    update();
    stateRequest = ConectionState.loading;
    update();
    var response = await orderData
        .pindingOrdersData(MyServecies.sharedPreferences.getString("id")!);
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

  orderStaatusePrint(String val) {
    if (val == "0") {
      return "The order is being prepared";
    } else if (val == "1") {
      return "Approved";
    } else if (val == "2") {
      return "On the way";
    } else {
      return "Archive";
    }
  }

  orderTypePrint(String val) {
    if (val == "0") {
      return "Delivery";
    } else {
      return "Recive";
    }
  }

  paymantWayPrint(String val) {
    if (val == "0") {
      return "Cash";
    } else {
      return "Payment Card";
    }
  }

  refreshOrderPage() {
    getPindingsOrders();
  }

  goToNotificationDetails(order) {
    Get.toNamed(AppRoutes.orderDetails, arguments: {"orderModel": order});
  }

  deleteOrder(String orderId) async {
    stateRequest = ConectionState.loading;
    update();
    var response = await deleteOrderData.orderDeleteData(orderId);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        refreshOrderPage();
      }
    } else {
      stateRequest = ConectionState.failure;
    }
  }

  @override
  void onInit() {
    getPindingsOrders();
    super.onInit();
  }
}
