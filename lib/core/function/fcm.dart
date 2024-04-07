import 'package:admin/controller/orders/approved_view_controller.dart';
import 'package:admin/controller/orders/archive_controller.dart';
import 'package:admin/controller/orders/pinding_controller.dart';
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
    FlutterRingtonePlayer().playNotification();
    Get.snackbar("succes", "your order has been aproved");
    refreshOrderPage(message.data);
  });
}

refreshOrderPage(data) {
  if (Get.currentRoute == "/orders" && data["pagename"] == "order") {
    PindingOrdersController controller = Get.find();
    ArchiveOrdersController controller2 = Get.find();
    ApprovedOrderContnroller contnroller3 = Get.find();
    controller.getPindingsOrders();
    controller2.getArchiveOrders();
    contnroller3.getApprovedOrders();
  }
}
