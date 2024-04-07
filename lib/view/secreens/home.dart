import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/home_controller.dart';
import 'package:flutter_application_19/core/classes/view_handling.dart';
import 'package:flutter_application_19/view/widgets/home/categries_list.dart';
import 'package:flutter_application_19/view/widgets/costtum_appbar.dart';
import 'package:flutter_application_19/view/widgets/home/costtum_card_home.dart';
import 'package:flutter_application_19/view/widgets/home/costtum_home_title.dart';
import 'package:flutter_application_19/view/widgets/home/items_list.dart';
import 'package:flutter_application_19/view/widgets/home/serch_items.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerIm());
    return GetBuilder<HomeControllerIm>(
        builder: ((controller) => WillPopScope(
              onWillPop: () => controller.serchFalse(),
              child: Container(
                // margin: EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(10),
                  child: ListView(children: [
                    CostuumAppBar(
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
                    !controller.isSearch
                        ? RequestHandling(
                            request: controller.stateRequest,
                            widget: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (controller.setting.isNotEmpty)
                                  CosttumCardHome(
                                      title:
                                          "${controller.setting["setting_title"]}",
                                      body:
                                          "${controller.setting["setting_body"]}"),
                                const CosttumHomeTitle(title: "Categories"),
                                const CategoriesList(),
                                const CosttumHomeTitle(title: "Top Selling"),
                                const SizedBox(
                                  height: 10,
                                ),
                                const ItemsList(),
                              ],
                            ),
                          )
                        : RequestHandling(
                            request: controller.stateRequest,
                            widget: Serch(
                              items: controller.searchItems,
                              priceWithdiscount: controller.priceDiscount,
                            ),
                          ),
                  ]),
                ),
              ),
            )));
  }
}
