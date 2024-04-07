import 'package:admin/controller/orders/archive_controller.dart';
import 'package:admin/core/classes/request_handling.dart';
import 'package:admin/core/shared/order_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Archive extends StatelessWidget {
  const Archive({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveOrdersController());
    return GetBuilder<ArchiveOrdersController>(
      builder: (controller) => ViewHandling(
          request: controller.stateRequest,
          widget: Container(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => OrderCard(
                      order: controller.archiveOrder[index],
                      onPressedDetails: () {
                        controller.goToDetails(controller.archiveOrder[index]);
                      },
                    )),
          )),
    );
  }
}
