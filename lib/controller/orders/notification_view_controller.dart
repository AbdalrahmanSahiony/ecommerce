import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/core/servecies/servecies.dart';
import 'package:flutter_application_19/data/data_source/remote/order/notification_view_data.dart';
import 'package:get/get.dart';

class NotificationViewController extends GetxController {
  NotificationViewData notificationViewData = NotificationViewData(Get.find());
  List data = [];
  ConectionState stateRequest = ConectionState.none;
  getNotification() async {
    data.clear();
    update();
    stateRequest = ConectionState.loading;
    update();
    var response = await notificationViewData
        .notificationData(MyServecies.sharedPreferences.getString("id")!);
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        data.addAll(response["data"]);
        update();
      } else {
        stateRequest = ConectionState.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getNotification();
    super.onInit();
  }
}
