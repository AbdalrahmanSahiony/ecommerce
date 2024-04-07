import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/favourite_view.dart';
import 'package:flutter_application_19/core/classes/view_handling.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';
import 'package:flutter_application_19/core/functions/teans_name.dart';
import 'package:flutter_application_19/data/model/favourit_mdel.dart';

class FavouriteGrid extends StatelessWidget {
  final FavouriteModel itemsModel;

  const FavouriteGrid(this.itemsModel, {super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(FavouritViewControllerImp());
    return GetBuilder<FavouritViewControllerImp>(
        builder: (controller) => RequestHandling(
            request: controller.stateRequest,
            widget: Card(
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView(
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            "${AppLink.itemsImage}/${itemsModel.itemsImage}",
                        height: 100,
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
                            "${itemsModel.itemsPrice}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: AppColor.primaryColor,
                                fontFamily: "sans",
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.deleteFavId(
                                  itemsModel.favouriteId.toString());
                            },
                            icon: const Icon(Icons.delete_outline),
                            color: AppColor.primaryColor,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
