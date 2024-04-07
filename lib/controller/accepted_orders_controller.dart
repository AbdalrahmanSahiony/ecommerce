import 'package:delivery/connection_state.dart';
import 'package:delivery/core/app_routes_string.dart';
import 'package:delivery/core/function/handling_data.dart';
import 'package:delivery/core/serviece.dart';
import 'package:delivery/data/model/order_model.dart';
import 'package:delivery/data/orders/accepted_data.dart';
import 'package:delivery/data/orders/done_data.dart';
import 'package:get/get.dart';

class AcceptedOrdersController extends GetxController {
  AcceptedViewData acceptedViewData = AcceptedViewData(Get.find());
  DoneOrder doneOrder = DoneOrder(Get.find());

  String? id;
  String? userName;
  List categories = [];
  List data = [];
  List<OrdersModel> pindingOrder = [];
  ConectionState stateRequest = ConectionState.none;

  getAcceptedOrders() async {
    data.clear();
    update();
    pindingOrder.clear();
    update();
    stateRequest = ConectionState.loading;
    update();
    var response = await acceptedViewData
        .acceptedViewData(MyServecies.sharedPreferences.get("id"));
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

  orderDone(String ordeId, String userId) async {
    stateRequest = ConectionState.loading;
    update();
    var response = await doneOrder.done(
        ordeId, MyServecies.sharedPreferences.get("id"), userId);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        getAcceptedOrders();
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

  goToOrderDetails(order) {
    Get.toNamed(AppRoutesString.orderDetails, arguments: {"order": order});
  }

  @override
  void onInit() {
    getAcceptedOrders();
    super.onInit();
  }
}
