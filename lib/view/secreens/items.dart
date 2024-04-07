// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/favourite_controller.dart';
import 'package:flutter_application_19/controller/items_controller.dart';
import 'package:flutter_application_19/core/classes/view_handling.dart';
import 'package:flutter_application_19/data/model/items_model.dart';
import 'package:flutter_application_19/view/widgets/costtum_appbar.dart';
import 'package:flutter_application_19/view/widgets/grid_items.dart';
import 'package:flutter_application_19/view/widgets/home/list_ctegories_items.dart';
import 'package:flutter_application_19/view/widgets/home/serch_items.dart';

class Item extends StatelessWidget {
  const Item({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavouriteControllerImp controllerFav = Get.put(FavouriteControllerImp());
    return GetBuilder<ItemsControllerImp>(
        builder: (controller) => WillPopScope(
              onWillPop: () => controller.isSearchFalse(),
              child: Scaffold(
                  body: Container(
                padding: const EdgeInsets.all(15),
                child: ListView(
                  children: [
                    CostuumAppBar(
                      title: "find items",
                      onPressedSearch: () {
                        controller.search();
                      },
                      onPressedIcon: () {},
                      onPressedFavourite: () {},
                      controller: controller.serchController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ItemsCategoriesList(),
                    const SizedBox(
                      height: 10,
                    ),
                    RequestHandling(
                        request: controller.stateRequest,
                        widget: !controller.isSearch
                            ? GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.6),
                                itemCount: controller.items.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  controllerFav.isFavourite[
                                          controller.items[index]["items_id"]] =
                                      controller.items[index]["favourite"];
                                  return ItemGrid(ItemsModel.fromJson(
                                      controller.items[index]));
                                })
                            : Serch(
                                items: controller.searchItems,
                                priceWithdiscount: controller.priceDiscount,
                              ))
                  ],
                ),
              )),
            ));
  }
}
