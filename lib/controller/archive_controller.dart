import 'package:delivery/connection_state.dart';
import 'package:delivery/core/app_routes_string.dart';
import 'package:delivery/core/function/handling_data.dart';
import 'package:delivery/core/serviece.dart';
import 'package:delivery/data/model/order_model.dart';
import 'package:delivery/data/orders/achive_data.dart';
import 'package:get/get.dart';

class ArchiveController extends GetxController {
  ArchiveData archiveData = ArchiveData(Get.find());
  String? id;
  String? userName;
  List categories = [];
  List data = [];
  List<OrdersModel> archiveOrder = [];
  ConectionState stateRequest = ConectionState.none;

  getPindingsOrders() async {
    data.clear();
    update();
    archiveOrder.clear();
    update();
    stateRequest = ConectionState.loading;
    update();
    var response = await archiveData
        .archiveData(MyServecies.sharedPreferences.getString("id"));
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

  paymantWayPrint(String val) {
    if (val == "0") {
      return "Cash";
    } else {
      return "Payment Card";
    }
  }

  goToOrderDetails(orde) {
    Get.toNamed(AppRoutesString.orderDetails, arguments: {"order": orde});
  }

  @override
  void onInit() {
    getPindingsOrders();
    super.onInit();
  }
}
