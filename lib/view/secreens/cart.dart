import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/cart_controller.dart';
import 'package:flutter_application_19/core/classes/view_handling.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';
import 'package:flutter_application_19/core/shared/custtom_buttom.dart';
import 'package:flutter_application_19/view/widgets/items_cart.dart';
import 'package:flutter_application_19/view/widgets/price_totalprice_cart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) => SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: controller.couponName == null
                        ? Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: TextFormField(
                                  controller: controller.couponController,
                                  decoration: InputDecoration(
                                    label: Container(
                                        margin: const EdgeInsets.all(8),
                                        child: const Text("Coupon Code")),
                                    border: const OutlineInputBorder(),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 10,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: CusttomButtom(
                                  lable: "apply",
                                  onTap: () {
                                    controller.getCoubonData();
                                    //hide keybord
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                  },
                                ),
                              ),
                            ],
                          )
                        : Text(
                            "copun code ${controller.couponName}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryColor),
                          )),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.primaryColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      PriceAndTotaPriceCart(
                          titlePrice: "Price",
                          price: "${controller.totalPrice}\$",
                          colorPrice: AppColor.gray),
                      PriceAndTotaPriceCart(
                          titlePrice: "coupon diacount",
                          price: "${controller.discount}%",
                          colorPrice: AppColor.gray),
                      const PriceAndTotaPriceCart(
                          titlePrice: "shpping",
                          price: "300\$",
                          colorPrice: AppColor.gray),
                      PriceAndTotaPriceCart(
                          titlePrice: "total",
                          price: "${controller.totalPriceCalc()}\$",
                          colorPrice: AppColor.primaryColor),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(7),
                  height: 60,
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: MaterialButton(
                    onPressed: () {
                      controller.goToCheckout();
                    },
                    child: Text(
                      "Place order",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: const Text("My Cart"),
        ),
        body: GetBuilder<CartController>(
          builder: (CartController controller) => RequestHandling(
            request: controller.stateRequest,
            widget: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  //  const CosttumAppbarCart(title: "My Cart"),
                  ...List.generate(
                      controller.cart.length,
                      (index) => ItemsCart(
                          controller.cart[index].itemsName.toString(),
                          "${controller.cart[index].itemsPrice! - (controller.cart[index].itemsPrice! * controller.cart[index].itemsDiscount!) / 100}",
                          controller.cart[index].itemsImage.toString(),
                          controller.cart[index].cartItemCount.toString())),
                ],
              ),
            ),
          ),
        ));
  }
}
