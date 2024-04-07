import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/items_details_controller.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';

class ItemsDetailsImage extends GetView<ItemsDetailsImp> {
  const ItemsDetailsImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          // height: 200,
          // width: double.infinity,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20))),
            child: Hero(
              tag: "${controller.details.itemsId}",
              child: CachedNetworkImage(
                imageUrl:
                    "${AppLink.itemsImage}/${controller.details.itemsImage}",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
