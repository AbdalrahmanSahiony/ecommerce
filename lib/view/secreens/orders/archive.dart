import 'package:flutter/material.dart';
import 'package:flutter_application_19/controller/orders/order_archive_controller.dart';
import 'package:flutter_application_19/view/widgets/dailog_rating.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/core/classes/view_handling.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';
import 'package:flutter_application_19/data/model/orders_model.dart';
import 'package:jiffy/jiffy.dart';

class ArchiveOrders extends StatelessWidget {
  const ArchiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveOrderController());
    return Scaffold(
      appBar: AppBar(title: const Text("Archive Orders")),
      body: Container(
          margin: const EdgeInsets.all(10),
          child: GetBuilder<ArchiveOrderController>(
            builder: (controller) => RequestHandling(
                request: controller.stateRequest,
                widget: ListView.builder(
                    reverse: true,
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) => OrderCard(
                          order: controller.archive[index],
                        ))),
          )),
    );
  }
}

class OrderCard extends GetView<ArchiveOrderController> {
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    color: AppColor.secondColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Order Tybe:${controller.orderTypePrint(order.ordersType.toString())}",
            style: const TextStyle(color: Colors.grey),
          ),
          Text("Order Price:  ${order.ordersPrice}\$",
              style: const TextStyle(color: Colors.grey)),
          Text("Deleviry Price: ${order.ordersPricedelivery}\$",
              style: const TextStyle(color: Colors.grey)),
          Text(
              "Payment Method:  ${controller.paymantWayPrint(order.ordersPaymentway.toString())}",
              style: const TextStyle(color: Colors.grey)),
          Text(
              "Order Statuse:  ${controller.orderStaatusePrint(order.orderStatus.toString())}",
              style: const TextStyle(color: Colors.grey)),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "total price:${order.ordersPrice}\$",
                style: const TextStyle(
                    color: AppColor.secondColor, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      controller.goToNotificationDetails(order);
                    },
                    color: AppColor.thirdColor,
                    child: const Text(
                      "Details",
                      style: TextStyle(color: AppColor.primaryColor),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  if (order.ordersRate == 0)
                    MaterialButton(
                      onPressed: () {
                        showRating(context, order);
                      },
                      color: AppColor.thirdColor,
                      child: const Text(
                        "Rating",
                        style: TextStyle(color: AppColor.primaryColor),
                      ),
                    ),
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
