import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/home_controller.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';
import 'package:flutter_application_19/data/model/items_model.dart';

class Serch extends StatelessWidget {
  final List<ItemsModel> items;
  final List priceWithdiscount;
  const Serch(
      {super.key, required this.items, required this.priceWithdiscount});
  @override
  Widget build(BuildContext context) {
    HomeControllerIm homeController = Get.find();

    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: InkWell(
              onTap: () {
                homeController.goToItemsDetails(items[index]);
              },
              child: Card(
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: CachedNetworkImage(
                          imageUrl:
                              "${AppLink.itemsImage}/${items[index].itemsImage}",
                        )),
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        title: Text(
                          "${items[index].itemsName}",
                        ),
                        subtitle: Text(
                          "${priceWithdiscount[index]}\$",
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
