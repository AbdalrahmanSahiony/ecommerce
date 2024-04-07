import 'package:delivery/controller/accepted_orders_controller.dart';
import 'package:delivery/controller/archive_controller.dart';
import 'package:delivery/controller/pinding_controller.dart';
import 'package:delivery/core/function/fcm.dart';
import 'package:delivery/view/secreen/accepted_order.dart';
import 'package:delivery/view/secreen/archive.dart';
import 'package:delivery/view/secreen/pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isActive = true;
  List<Widget> pages = [
    const PindingOrders(),
    const AcceptedOrders(),
    const Archive(),
  ];
  List buttons = [
    {"text": "Pinding", "icon": Icons.home},
    {"text": "Accepet", "icon": Icons.settings},
    {"text": "Archive", "icon": Icons.card_travel},
  ];

  int currentPage = 0;
  changePage(int i) {
    currentPage = i;
    update();
    if (i == 0) {
      PindingOrdersController controller = Get.put(PindingOrdersController());
      controller.getPindingsOrders();
    } else if (i == 1) {
      AcceptedOrdersController controller = Get.put(AcceptedOrdersController());
      controller.getAcceptedOrders();
    } else if (i == 3) {
      ArchiveController controller = Get.put(ArchiveController());
      controller.getPindingsOrders();
    }
  }

  @override
  void onInit() {
    fcmConfig();
    super.onInit();
  }
}
