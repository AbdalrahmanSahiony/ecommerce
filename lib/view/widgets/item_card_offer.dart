import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_19/controller/offers_view_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';
import 'package:flutter_application_19/core/functions/teans_name.dart';
import 'package:flutter_application_19/data/model/items_model.dart';

class ItemCardOffer extends GetView<OffersViewController> {
  final ItemsModel itemsModel;
  final double priceWithDiscount;

  const ItemCardOffer(this.itemsModel, this.priceWithDiscount, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OffersViewController>(
      builder: (controller) => Card(
        child: InkWell(
          onTap: () {
            //  controller.goToItemsDetails(itemsModel);
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: [
                ListView(
                  shrinkWrap: true,
                  children: [
                    Hero(
                      tag: "${itemsModel.itemsId}",
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.itemsImage}/${itemsModel.itemsImage}",
                        height: 130,
                      ),
                    ),
                    Text(
                      "${transName(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColor.gray,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${transName(itemsModel.itemsDescreptionAr, itemsModel.itemsDescreption)}",
                      style: const TextStyle(color: AppColor.gray),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "${itemsModel.itemsPrice}\$",
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: AppColor.primaryColor,
                              fontFamily: "sans",
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$priceWithDiscount\$",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontFamily: "sans",
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
                CachedNetworkImage(
                  imageUrl: "${AppLink.itemsImage}/sale2.png",
                  width: 32,
                  height: 32,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
