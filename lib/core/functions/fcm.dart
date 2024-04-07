import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_application_19/controller/orders/pinding_orders.dart';
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
  if (Get.currentRoute == "/pindingOrders" && data["pagename"] == "order") {
    PindingOrdersController controller = Get.find();
    controller.refreshOrderPage();
  }
}
