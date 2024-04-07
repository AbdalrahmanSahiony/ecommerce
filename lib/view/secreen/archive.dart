import 'package:delivery/controller/archive_controller.dart';
import 'package:delivery/core/classes/request_handling.dart';
import 'package:delivery/core/const/colors.dart';
import 'package:delivery/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class Archive extends StatelessWidget {
  const Archive({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveController());
    return Container(
      margin: const EdgeInsets.all(10),
      child: GetBuilder<ArchiveController>(
        builder: (controller) => ViewHandling(
            request: controller.stateRequest,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => OrderCard(
                      order: controller.archiveOrder[index],
                    ))),
      ),
    );
  }
}

class OrderCard extends GetView<ArchiveController> {
  final OrdersModel order;
  const OrderCard({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Order Number:${order.ordersId}",
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    Jiffy.parse("${order.ordersDatetime}").from(Jiffy.parse(
                        "${DateTime.now().subtract(const Duration(hours: 3))}")),
                    style: const TextStyle(
                        color: AppColor.secondColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Order Price:  ${order.ordersPrice}\$",
                  style: const TextStyle(color: Colors.grey)),
              Text("Deleviry Price: ${order.ordersPricedelivery}\$",
                  style: const TextStyle(color: Colors.grey)),
              Text(
                  "Payment Method:  ${controller.paymantWayPrint(order.ordersPaymentway.toString())}",
                  style: const TextStyle(color: Colors.grey)),
              Text("Shipping Address:  ${order.city} ${order.street}",
                  style: const TextStyle(color: Colors.grey)),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    " total price:${order.ordersPrice}\$",
                    style: const TextStyle(
                        color: AppColor.secondColor,
                        fontWeight: FontWeight.bold),
                  ),
                  MaterialButton(
                    onPressed: () {
                      controller.goToOrderDetails(order);
                    },
                    color: AppColor.thirdColor,
                    child: const Text(
                      "Details",
                      style: TextStyle(color: AppColor.primaryColor),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}