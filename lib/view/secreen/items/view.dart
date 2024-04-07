import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/classes/request_handling.dart';
import 'package:admin/core/constant/colors.dart';
import 'package:admin/core/shared/custtom_appbar.dart';
import 'package:admin/view/secreen/items/search.dart';
import 'package:admin/view/widget/items_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});
  @override
  Widget build(BuildContext context) {
    ItemsViewController controller = Get.put(ItemsViewController());
    return Scaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.primaryColor),
        child: IconButton(
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            controller.goToAddItem();
          },
        ),
      ),
      body: GetBuilder<ItemsViewController>(
        builder: (controller) => WillPopScope(
          onWillPop: () => controller.serchFalse(),
          child: ViewHandling(
              request: controller.stateRequest,
              widget: ListView(shrinkWrap: true, children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  child: CostuumAppBar(
                    title: "Items",
                    onPressedSearch: () {
                      controller.serchItems();
                    },
                    controller: controller.search,
                    onChanged: (val) {
                      controller.serrchState(val);
                    },
                  ),
                ),
                !controller.isSearch
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 18),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CardItem(
                              itemsModel: controller.items[index],
                              onPressedDelete: () {
                                controller.removeItems(
                                    controller.items[index].itemsId.toString(),
                                    controller.items[index].itemsImage
                                        .toString());
                              },
                              onPressedEdit: () {
                                controller
                                    .goToEditItem(controller.items[index]);
                              },
                            );
                          },
                        ),
                      )
                    : const Search(),
              ])),
        ),
      ),
    );
  }
}
