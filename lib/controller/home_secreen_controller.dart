import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';
import 'package:flutter_application_19/view/secreens/notification_view.dart';
import 'package:flutter_application_19/view/secreens/offers.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/view/secreens/home.dart';
import 'package:flutter_application_19/view/secreens/settings.dart';

abstract class HomeSecreenController extends GetxController {
  changePage(int i);
  goTOCart();
}

class HomeSecreenControllerImp extends HomeSecreenController {
  List<Widget> pages = [
    const Home(),
    const Settings(),
    const Offers(),
    const NotificationView(),
  ];
  List buttons = [
    {"text": "home", "icon": Icons.home},
    {"text": "settings", "icon": Icons.settings},
    {"text": "offers", "icon": Icons.discount},
    {"text": "notify", "icon": Icons.notifications_active_outlined},
  ];
  int currentPage = 0;
  @override
  changePage(int i) {
    currentPage = i;
    update();
  }

  @override
  goTOCart() {
    Get.toNamed("/cart");
  }

  alertExitApp() {
    Get.defaultDialog(
        title: "Warning",
        middleText: "Do you want exit from app",
        onCancel: () {},
        onConfirm: () {
          exit(0);
        },
        cancelTextColor: AppColor.primaryColor,
        buttonColor: AppColor.primaryColor,
        confirmTextColor: AppColor.thirdColor,
        titleStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: AppColor.primaryColor));
    // the used widget requier future function
    return Future.value(false);
  }
}
