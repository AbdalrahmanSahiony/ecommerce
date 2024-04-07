import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/core/constans/routesString.dart';
import 'package:flutter_application_19/core/servecies/servecies.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsController extends GetxController {
  MyServecies myServecies = Get.find();
  String? userId = MyServecies.sharedPreferences.getString("id");
  bool notfySwich = true;

  List<Map<String, dynamic>> get settings {
    return [
      {
        "text": const Text("Enable notification"),
        "icon": Switch(
          value: notfySwich,
          onChanged: (bool val) {
            notfySwich = val;
            update();
            enableAndDisebaleNoty(notfySwich);
          },
        )
      },
      {
        "text": const Text("Adress"),
        "icon": IconButton(
          icon: const Icon(Icons.location_on_outlined),
          onPressed: () {
            Get.toNamed(AppRoutes.viewAddress);
          },
        )
      },
      {
        "text": const Text("orders pinding"),
        "icon": IconButton(
          icon: const Icon(Icons.card_travel),
          alignment: Alignment.centerLeft,
          onPressed: () {
            Get.toNamed(AppRoutes.pindingOrders);
          },
        )
      },
      {
        "text": const Text("order archive"),
        "icon": IconButton(
          icon: const Icon(Icons.archive),
          alignment: Alignment.centerLeft,
          onPressed: () {
            Get.toNamed(AppRoutes.archiveOrders);
          },
        )
      },
      {
        "text": const Text("About us"),
        "icon": IconButton(
          icon: const Icon(Icons.help_outline),
          alignment: Alignment.topCenter,
          onPressed: () {},
        )
      },
      {
        "text": const Text("Contact us"),
        "icon": IconButton(
          icon: const Icon(Icons.phone_outlined),
          alignment: Alignment.topCenter,
          onPressed: () async {
            await launchUrl(Uri.parse("tel:+963934593329"));
          },
        )
      },
      {
        "text": const Text("logout"),
        "icon": IconButton(
          icon: const Icon(Icons.exit_to_app_outlined),
          alignment: Alignment.centerLeft,
          onPressed: () {
            FirebaseMessaging.instance.unsubscribeFromTopic("user");
            FirebaseMessaging.instance.unsubscribeFromTopic(
                "user${MyServecies.sharedPreferences.getString("id")}");
            MyServecies.sharedPreferences.clear();
            Get.offAllNamed(AppRoutes.logIn);
          },
        )
      },
    ];
  }

  enableAndDisebaleNoty(bool value) {
    if (value) {
      FirebaseMessaging.instance.subscribeToTopic("user");
      FirebaseMessaging.instance.subscribeToTopic("user$userId");
    } else if (!value) {
      FirebaseMessaging.instance.unsubscribeFromTopic("user");
      FirebaseMessaging.instance.unsubscribeFromTopic("user$userId");
    }
  }
}
