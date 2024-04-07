import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/orders/checkout_controller.dart';
import 'package:flutter_application_19/core/classes/view_handling.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';
import 'package:flutter_application_19/core/constans/image_assets.dart';
import 'package:flutter_application_19/view/widgets/checkout/address_card.dart';
import 'package:flutter_application_19/view/widgets/checkout/delivery_way.dart';
import 'package:flutter_application_19/view/widgets/checkout/payment_way.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutController controller = Get.put(CheckOutController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check Out"),
      ),
      bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            color: AppColor.primaryColor,
            textColor: Colors.white,
            onPressed: () {
              controller.checkout();
            },
            child: const Text(
              "Checkout",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
      body: RequestHandling(
        request: controller.stateRequest,
        widget: GetBuilder<CheckOutController>(
          builder: (controller) => Container(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  const Text(
                    "Chose Payment Method",
                    style: TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  PaymentWay(
                    title: "Cash",
                    isActive: controller.paymentyWay == "0" ? true : false,
                    onTap: () {
                      controller.chosepaymentWay("0");
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PaymentWay(
                    onTap: () {
                      controller.chosepaymentWay("1");
                    },
                    title: "Payment Cards",
                    isActive: controller.paymentyWay == "1" ? true : false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Chose Your Delivery Way",
                    style: TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      DeliveryWay(
                          onTap: () {
                            controller.choseDeliverWay("0");
                          },
                          deliveryType: "delivery",
                          imageName: AppImageAssets.delavery,
                          isActive:
                              controller.deliveryWay == "0" ? true : false),
                      const SizedBox(
                        width: 10,
                      ),
                      DeliveryWay(
                          onTap: () {
                            controller.choseDeliverWay("1");
                          },
                          deliveryType: "Drive Thru",
                          imageName: AppImageAssets.driveThru,
                          isActive:
                              controller.deliveryWay == "1" ? true : false),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (controller.deliveryWay == "0" && controller.data.isEmpty)
                    GestureDetector(
                        onTap: () {
                          controller.goToAddAddress();
                        },
                        child: const Center(
                            child: Text(
                          "plese add shiiping address \n Click here",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        ))),
                  if (controller.deliveryWay == "0" &&
                      controller.addressModel.isNotEmpty)
                    const Text(
                      "Shapping Address",
                      style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  if (controller.deliveryWay == "0")
                    ...List.generate(
                        controller.data.length,
                        (index) => AddressCard(
                            onTap: () {
                              controller.choseYourAddress(
                                  "${controller.addressModel[index].addressId}");
                            },
                            title: "${controller.addressModel[index].name}",
                            bodyText: "${controller.addressModel[index].city}",
                            isActive:
                                "${controller.addressModel[index].addressId}" ==
                                        controller.addres
                                    ? true
                                    : false))
                ],
              )),
        ),
      ),
    );
  }
}
