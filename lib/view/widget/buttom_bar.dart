import 'package:admin/controller/orders/order_controller.dart';
import 'package:admin/view/widget/bottom_bar_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottumBar extends StatelessWidget {
  const BottumBar({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (controller) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ...List.generate(
          controller.pages.length,
          (index) => ButtomAppBarButton(
              textButton: controller.buttons[index]["text"],
              icon: controller.buttons[index]["icon"],
              onPressed: () {
                controller.changePage(index);
              },
              active: controller.currentPage == index ? true : false),
        ),
      ]);
    });
  }
}