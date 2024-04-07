import 'package:admin/connection_state.dart';
import 'package:admin/core/app_routes_string.dart';
import 'package:admin/core/function/handling_data.dart';
import 'package:admin/data/model/order_model.dart';
import 'package:admin/data/order_data.dart';
import 'package:get/get.dart';

class ArchiveOrdersController extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());
  String? id;
  String? userName;
  List data = [];
  List<OrdersModel> archiveOrder = [];
  ConectionState stateRequest = ConectionState.none;

  getArchiveOrders() async {
    data.clear();
    update();
    archiveOrder.clear();
    update();
    stateRequest = ConectionState.loading;
    update();
    var response = await ordersData.archive();
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        data.addAll(response["data"]);
        update();
        archiveOrder.addAll(data.map((e) => OrdersModel.fromJson(e)));
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

  @override
  void onInit() {
    getArchiveOrders();
    super.onInit();
  }
}
