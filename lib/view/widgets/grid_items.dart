import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/favourite_controller.dart';
import 'package:flutter_application_19/controller/items_controller.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';
import 'package:flutter_application_19/core/functions/teans_name.dart';
import 'package:flutter_application_19/data/model/items_model.dart';

class ItemGrid extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;

  const ItemGrid(this.itemsModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(
      builder: (controller) => Card(
        child: InkWell(
          onTap: () {
            controller.goToItemsDetails(itemsModel);
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: [
                ListView(
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
                        if (itemsModel.itemsDiscount != 0)
                          Text(
                            "${itemsModel.itemsPrice}\$",
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: AppColor.primaryColor,
                                fontFamily: "sans",
                                fontWeight: FontWeight.bold),
                          ),
                        Text(
                          "${itemsModel.itemPriceDiscount}\$",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontFamily: "sans",
                              fontWeight: FontWeight.bold),
                        ),
                        GetBuilder<FavouriteControllerImp>(
                          builder: (conroller) => IconButton(
                            icon: Icon(
                              conroller.isFavourite[itemsModel.itemsId] == 1
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: AppColor.primaryColor,
                            ),
                            onPressed: () {
                              int? val;
                              if (conroller.isFavourite[itemsModel.itemsId] ==
                                  0) {
                                val = conroller
                                    .isFavourite[itemsModel.itemsId] = 1;
                                conroller.addFavourite(
                                    itemsModel.itemsId.toString());
                              } else {
                                conroller.isFavourite[itemsModel.itemsId] = 0;
                                conroller.removeFavourite(
                                    itemsModel.itemsId.toString());
                                val = 0;
                              }

                              conroller.setFavourite(
                                  itemsModel.itemsId.toString(), val);
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
                if (itemsModel.itemsDiscount != 0)
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
