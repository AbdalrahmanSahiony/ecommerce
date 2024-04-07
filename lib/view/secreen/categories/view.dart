import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/classes/request_handling.dart';
import 'package:admin/core/constant/colors.dart';
import 'package:admin/view/widget/card_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});
  @override
  Widget build(BuildContext context) {
    CategoriesViewController controller = Get.put(CategoriesViewController());
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
            controller.goToAddcategories();
          },
        ),
      ),
      appBar: AppBar(title: const Text("categories")),
      body: GetBuilder<CategoriesViewController>(
        builder: (controller) => ViewHandling(
          request: controller.stateRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Cardcategories(
                  categorisModel: controller.categories[index],
                  onPressedDelete: () {
                    controller.removecategories(
                        controller.categories[index].categoriesId.toString(),
                        controller.categories[index].categoriesImage
                            .toString());
                  },
                  onPressedEdit: () {
                    controller.goToEditcategories(controller.categories[index]);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
