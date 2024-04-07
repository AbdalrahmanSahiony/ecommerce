import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/home_controller.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';
import 'package:flutter_application_19/data/model/items_model.dart';

class ItemsList extends GetView<HomeControllerIm> {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.itemsTopSelling.length,
        itemBuilder: ((BuildContext context, int i) =>
            Items(itemsModel: controller.itemsTopSelling[i])),
      ),
    );
  }
}

class Items extends StatelessWidget {
  final ItemsModel itemsModel;
  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    HomeControllerIm controller = Get.find();
    return GestureDetector(
      onTap: () {
        controller.goToItemsDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: CachedNetworkImage(
              imageUrl: "${AppLink.itemsImage}/${itemsModel.itemsImage}",
              height: 150,
              width: 150,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.black.withOpacity(0.3),
            ),
            height: 150,
            width: 150,
          ),
          Positioned(
              left: 15,
              top: 10,
              child: Text(
                "${itemsModel.itemsName}",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
