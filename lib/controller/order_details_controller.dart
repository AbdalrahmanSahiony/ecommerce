import 'package:delivery/connection_state.dart';
import 'package:delivery/core/classes/curd.dart';
import 'package:delivery/core/function/handling_data.dart';
import 'package:delivery/data/model/order_details_model.dart';
import 'package:delivery/data/model/order_model.dart';
import 'package:delivery/data/orders/order_details_data.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  late OrdersModel order;
  OrderDetailsViewData orderDetailsViewData = OrderDetailsViewData(Curd());
  List data = [];
  List prices = [];
  List<OrdersDetailsModel> orderDetails = [];
  ConectionState stateRequest = ConectionState.none;
  getOrderDetails() async {
    data.clear();
    update();
    stateRequest = ConectionState.loading;
    update();
    var response = await orderDetailsViewData.orderDetailsData("74");
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
    order = Get.arguments["order"];
    getOrderDetails();
    super.onInit();
  }
}
