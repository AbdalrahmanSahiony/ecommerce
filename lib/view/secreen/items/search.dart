import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/view/widget/items_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsViewController controller = Get.find();
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.dataSercg.length,
        itemBuilder: (context, index) => CardItem(
          itemsModel: controller.itemSerch[index],
          onPressedDelete: () {
            controller.removeItems(
                controller.itemSerch[index].itemsId.toString(),
                controller.itemSerch[index].itemsImage.toString());
          },
          onPressedEdit: () {
            controller.goToEditItem(controller.itemSerch[index]);
          },
        ),
      ),
    );
  }
}
