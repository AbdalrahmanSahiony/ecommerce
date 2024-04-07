import 'package:admin/connection_state.dart';

import 'package:admin/core/function/handling_data.dart';
import 'package:admin/data/model/order_details_model.dart';
import 'package:admin/data/model/order_model.dart';
import 'package:admin/data/order_data.dart';
import 'package:get/get.dart';

class OrdersDetailsController extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());
  List data = [];
  List prices = [];
  List<OrderDetailsModel> detailsOrder = [];
  late OrdersModel order;
  ConectionState stateRequest = ConectionState.none;

  getOrdersDtails() async {
    stateRequest = ConectionState.loading;
    update();
    var response = await ordersData.detailsData(order.ordersId.toString());
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        data.addAll(response["data"]);
        update();
        detailsOrder.addAll(data.map((e) => OrderDetailsModel.fromJson(e)));
        update();
        for (int i = 0; i < data.length; i++) {
          double s = data[i]["items_price"] -
              (data[i]["items_price"] * data[i]["items_discount"]) / 100;
          prices.add(s);
        }
      } else {
        stateRequest = ConectionState.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    order = Get.arguments["order"];
    getOrdersDtails();
    super.onInit();
  }
}
