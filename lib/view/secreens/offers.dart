import 'package:flutter/material.dart';
import 'package:flutter_application_19/controller/favourite_controller.dart';
import 'package:flutter_application_19/controller/offers_view_controller.dart';
import 'package:flutter_application_19/core/classes/view_handling.dart';
import 'package:flutter_application_19/view/widgets/costtum_appbar.dart';
import 'package:flutter_application_19/view/widgets/home/serch_items.dart';
import 'package:flutter_application_19/view/widgets/item_card_offer.dart';
import 'package:get/get.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersViewController());
    Get.put(FavouriteControllerImp());
    return Scaffold(
        appBar: AppBar(title: const Text("Offers")),
        body: GetBuilder<OffersViewController>(
            builder: (controller) => RequestHandling(
                request: controller.stateRequest,
                widget: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: CostuumAppBar(
                            controller: controller.serchController,
                            onChanged: (val) {
                              controller.changeSearchState(val);
                            },
                            title: "Find Products",
                            onPressedSearch: () {
                              controller.search();
                            },
                            onPressedIcon: () {},
                            onPressedFavourite: () {
                              controller.goToFavourite();
                            },
                          ),
                        ),
                        !controller.isSearch
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.data.length,
                                itemBuilder: (context, index) => ItemCardOffer(
                                    controller.offerItems[index],
                                    controller.prices[index]))
                            : RequestHandling(
                                request: controller.stateRequest,
                                widget: Serch(
                                  items: controller.searchItems,
                                  priceWithdiscount: controller.priceDiscount,
                                ),
                              ),
                      ],
                    ),
                  ),
                ))));
  }
}
