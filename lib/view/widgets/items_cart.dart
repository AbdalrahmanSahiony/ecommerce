import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/cart_controller.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';

class ItemsCart extends GetView<CartController> {
  final String name;
  final String price;
  final String imageUrl;
  final String count;
  const ItemsCart(
    this.name,
    this.price,
    this.imageUrl,
    this.count, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: controller.cart.isNotEmpty
          ? Card(
              child: Row(children: [
                Expanded(
                    flex: 2,
                    child: CachedNetworkImage(
                      imageUrl: "${AppLink.itemsImage}/$imageUrl",
                    )),
                Expanded(
                    flex: 3,
                    child: ListTile(
                      title: Text(name),
                      subtitle: Text(
                        "$price\$",
                        style: const TextStyle(
                            fontSize: 15, color: AppColor.primaryColor),
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: SizedBox(height: 30, child: Text(count)),
                ),
              ]),
            )
          : const Center(
              child: Text("empty"),
            ),
    );
  }
}
