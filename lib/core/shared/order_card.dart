import 'package:admin/core/constant/colors.dart';
import 'package:admin/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class OrderCard extends StatelessWidget {
  final OrdersModel order;
  final void Function()? onPressedDetails;
  final void Function()? onPressedAprrove;
  final void Function()? onPressedDone;
  const OrderCard(
      {super.key,
      required this.order,
      this.onPressedAprrove,
      this.onPressedDetails,
      this.onPressedDone});

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
                    onPressed: onPressedDetails,
                    color: AppColor.thirdColor,
                    child: const Text(
                      "Details",
                      style: TextStyle(color: AppColor.primaryColor),
                    ),
                  ),
                  if (order.orderStatus == 0)
                    MaterialButton(
                      onPressed: onPressedAprrove,
                      color: AppColor.thirdColor,
                      child: const Text(
                        "Approve",
                        style: TextStyle(color: AppColor.primaryColor),
                      ),
                    ),
                  if (order.orderStatus == 1)
                    MaterialButton(
                      onPressed: onPressedDone,
                      color: AppColor.thirdColor,
                      child: const Text(
                        "Done",
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
