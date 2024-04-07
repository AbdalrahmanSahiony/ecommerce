import 'package:admin/controller/orders/order_controller.dart';
import 'package:admin/view/widget/buttom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderController());
    return Scaffold(
      appBar: AppBar(title: const Text("Orders")),
      bottomNavigationBar: const BottumBar(),
      body: GetBuilder<OrderController>(
          builder: (controller) => controller.pages[controller.currentPage]),
    );
  }
}
