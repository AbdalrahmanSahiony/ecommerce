import 'package:delivery/controller/accepted_orders_controller.dart';
import 'package:delivery/controller/archive_controller.dart';
import 'package:delivery/controller/homeSecreen_controller.dart';
import 'package:delivery/controller/pinding_controller.dart';
import 'package:delivery/core/app_routes_string.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requestPermissionNotfication() async {
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen((message) {
    FlutterRingtonePlayer.playNotification();
    Get.snackbar("succes", message.data["message"]);
    refreshOrderPage(message.data);
  });
}

refreshOrderPage(data) {
  if (Get.currentRoute == AppRoutesString.home && data["pagename"] == "home") {
    HomeController controller = Get.find();
    if (controller.currentPage == 0) {
      PindingOrdersController controller1 = Get.find();
      controller1.getPindingsOrders();
    } else if (controller.currentPage == 1) {
      AcceptedOrdersController controller1 = Get.find();
      controller1.getAcceptedOrders();
    } else if (controller.currentPage == 3) {
      ArchiveController controller1 = Get.find();
      controller1.getPindingsOrders();
    }
  }
}
