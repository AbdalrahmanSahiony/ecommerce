import 'package:admin/controller/orders/pinding_controller.dart';
import 'package:admin/core/classes/request_handling.dart';
import 'package:admin/core/shared/order_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingView extends StatelessWidget {
  const PendingView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(PindingOrdersController());
    return GetBuilder<PindingOrdersController>(
      builder: (controller) => ViewHandling(
          request: controller.stateRequest,
          widget: Container(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => OrderCard(
                      order: controller.pindingOrder[index],
                      onPressedAprrove: () {
                        controller.approveOrder(
                            controller.pindingOrder[index].ordersUserid
                                .toString(),
                            controller.pindingOrder[index].ordersId.toString());
                      },
                      onPressedDetails: () {
                        controller.goToDetails(controller.pindingOrder[index]);
                      },
                    )),
          )),
    );
  }
}
