import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/data/data_source/remote/order/order_details_data.dart';
import 'package:flutter_application_19/data/model/order_details_model.dart';
import 'package:flutter_application_19/data/model/orders_model.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  late OrdersModel order;
  OrderDetailsViewData orderDetailsViewData = OrderDetailsViewData(Get.find());
  List data = [];
  List prices = [];
  List<OrdersDetailsModel> orderDetails = [];
  ConectionState stateRequest = ConectionState.none;
  getOrderDetails() async {
    data.clear();
    update();
    stateRequest = ConectionState.loading;
    update();
    var response =
        await orderDetailsViewData.orderDetailsData(order.ordersId.toString());
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        data.addAll(response["data"]);
        orderDetails.addAll(data.map((e) => OrdersDetailsModel.fromJson(e)));
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
    order = Get.arguments["orderModel"];
    getOrderDetails();
    super.onInit();
  }
}
