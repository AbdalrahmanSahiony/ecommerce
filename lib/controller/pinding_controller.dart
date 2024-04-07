import 'package:delivery/connection_state.dart';
import 'package:delivery/core/function/handling_data.dart';
import 'package:delivery/core/serviece.dart';
import 'package:delivery/data/model/order_model.dart';
import 'package:delivery/data/orders/approve.dart';
import 'package:delivery/data/orders/pinding_view_data.dart';
import 'package:get/get.dart';

class PindingOrdersController extends GetxController {
  PindingData pindingData = PindingData(Get.find());
  ApproveOrder approveOrder = ApproveOrder(Get.find());
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
    var response = await pindingData
        .pindingData(MyServecies.sharedPreferences.getString("id")!);
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

  accepetOrder(String orderId, String userId) async {
    stateRequest = ConectionState.loading;
    update();
    var response = await approveOrder.approve(
        orderId, MyServecies.sharedPreferences.getString("id"), userId);

    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        getPindingsOrders();
      } else {
        stateRequest = ConectionState.failure;
      }
    }
    update();
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
