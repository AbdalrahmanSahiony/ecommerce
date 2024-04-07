import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/items_details_controller.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';
import 'package:flutter_application_19/core/servecies/servecies.dart';
import 'package:flutter_application_19/view/widgets/color_containers.dart';
import 'package:flutter_application_19/view/widgets/items_details_image.dart';
import 'package:flutter_application_19/view/widgets/items_price_count.dart';

class ItemsDetails extends GetView<ItemsDetailsImp> {
  const ItemsDetails({super.key});
  @override
  Widget build(BuildContext context) {
    var userId = MyServecies.sharedPreferences.getString("id");
    Get.put(ItemsDetailsImp());

    return Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(7),
          height: 60,
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(15)),
          child: MaterialButton(
            onPressed: () {
              controller.goToCart();
            },
            child: Text(
              "Go to Cart",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        body: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                const ItemsDetailsImage(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("${controller.details.itemsName}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: AppColor.blackBlue)),
                    GetBuilder<ItemsDetailsImp>(builder: (controller) {
                      return PriceCount(
                          statuseRequest: controller.stateRequest,
                          price: "${controller.priceWithDiscount}\$",
                          count: controller.cart.isEmpty
                              ? "0"
                              : controller.cart[controller.i]["cart_item_count"]
                                  .toString(),
                          onPressedAdd: () {
                            controller.addCart(
                                userId, controller.details.itemsId.toString());
                          },
                          onPressedRemove: () {
                            controller.removeCart(
                                userId, controller.details.itemsId.toString());
                          });
                    }),
                    Text(
                      " ${controller.details.itemsDescreption} ${controller.details.itemsDescreption} ${controller.details.itemsDescreption} ${controller.details.itemsDescreption} ${controller.details.itemsDescreption} ${controller.details.itemsDescreption} ${controller.details.itemsDescreption} ${controller.details.itemsDescreption} ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColor.gray),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      "Color",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: AppColor.blackBlue, fontSize: 25),
                    ),
                    const ColorContainers(),
                  ],
                ),
              ],
            )));
  }
}
