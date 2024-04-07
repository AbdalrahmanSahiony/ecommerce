import 'package:admin/controller/orders/approved_view_controller.dart';
import 'package:admin/core/classes/request_handling.dart';
import 'package:admin/core/shared/order_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApprvedOrdera extends StatelessWidget {
  const ApprvedOrdera({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ApprovedOrderContnroller());
    return GetBuilder<ApprovedOrderContnroller>(
        builder: (controller) => ViewHandling(
              request: controller.stateRequest,
              widget: Container(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) => OrderCard(
                      order: controller.approvedOrder[index],
                      onPressedDetails: () {
                        controller.goToDetails(controller.approvedOrder[index]);
                      },
                      onPressedDone: () {
                        controller.doneOrdr(
                            controller.approvedOrder[index].ordersUserid
                                .toString(),
                            controller.approvedOrder[index].ordersId.toString(),
                            controller.approvedOrder[index].orderStatus
                                .toString());
                      },
                    ),
                  )),
            ));
  }
}
