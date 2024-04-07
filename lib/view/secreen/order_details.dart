import 'package:delivery/controller/order_details_controller.dart';
import 'package:delivery/core/classes/request_handling.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/const/colors.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return Scaffold(
        appBar: AppBar(title: const Text("Order Details")),
        body: GetBuilder<OrderDetailsController>(
          builder: (controller) => ViewHandling(
            request: controller.stateRequest,
            widget: ListView(
              children: [
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: Card(
                        child: ListView(
                      shrinkWrap: true,
                      children: [
                        Table(
                          children: [
                            const TableRow(children: [
                              Text(
                                "Item",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "QTY",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Price",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            ...List.generate(
                                controller.data.length,
                                (index) => TableRow(children: [
                                      Text(
                                        "${controller.orderDetails[index].itemsName}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: AppColor.grey400),
                                      ),
                                      Text(
                                        "${controller.orderDetails[index].itemsCount}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: AppColor.grey400),
                                      ),
                                      Text(
                                        "${controller.prices[index]}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: AppColor.grey400),
                                      ),
                                    ])),
                          ],
                        ),
                        Center(
                          child: Text(
                            "Price:${controller.order.ordersPrice}\$",
                            style: const TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        if (controller.order.ordersType == 0)
                          ListTile(
                            title: const Text(
                              "Shipping Address",
                              style: TextStyle(color: AppColor.primaryColor),
                            ),
                            subtitle: Text(
                                "${controller.order.city} ${controller.order.street}"),
                          ),
                      ],
                    ))),
              ],
            ),
          ),
        ));
  }
}
