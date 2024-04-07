import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/core/constans/routesString.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/core/servecies/servecies.dart';
import 'package:flutter_application_19/data/data_source/remote/order/order_archive.dart';
import 'package:flutter_application_19/data/model/orders_model.dart';
import 'package:get/get.dart';

class ArchiveOrderController extends GetxController {
  OrderArchiveData orderArchiveData = OrderArchiveData(Get.find());
  List data = [];
  List<OrdersModel> archive = [];
  ConectionState stateRequest = ConectionState.none;
  getArchive() async {
    data.clear();
    update();
    stateRequest = ConectionState.loading;
    update();
    var response = await orderArchiveData
        .getArchiveData(MyServecies.sharedPreferences.getString("id")!);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        data.addAll(response["data"]);
        archive.addAll(data.map((e) => OrdersModel.fromJson(e)));
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

  goToNotificationDetails(order) {
    Get.toNamed(AppRoutes.orderDetails, arguments: {"orderModel": order});
  }

  grtOrderRating(String orderId, double rating, String ratingNote) async {
    var response =
        await orderArchiveData.orderRatingData(orderId, rating, ratingNote);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        getArchive();
      } else {
        stateRequest = ConectionState.failure;
      }
    }
    update();
    print(response["status"]);
  }

  @override
  void onInit() {
    getArchive();
    super.onInit();
  }
}
