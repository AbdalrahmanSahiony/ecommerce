import 'package:admin/controller/orders/approved_view_controller.dart';
import 'package:admin/controller/orders/archive_controller.dart';
import 'package:admin/controller/orders/pinding_controller.dart';
import 'package:admin/view/secreen/orders/approves_order.dart';
import 'package:admin/view/secreen/orders/archive.dart';
import 'package:admin/view/secreen/orders/pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  List<Widget> pages = [
    const PendingView(),
    const ApprvedOrdera(),
    const Archive()
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
      PindingOrdersController controller0 = Get.find();
      controller0.getPindingsOrders();
    } else if (i == 1) {
      ApprovedOrderContnroller contnroller1 =
          Get.put(ApprovedOrderContnroller());
      contnroller1.getApprovedOrders();
    } else if (i == 2) {
      ArchiveOrdersController controller2 = Get.put(ArchiveOrdersController());
      controller2.getArchiveOrders();
    }
  }
}
