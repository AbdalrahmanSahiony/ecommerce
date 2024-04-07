import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/items_controller.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';
import 'package:flutter_application_19/core/functions/teans_name.dart';
import 'package:flutter_application_19/data/model/categories_model.dart';

class ItemsCategoriesList extends GetView<ItemsControllerImp> {
  const ItemsCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, i) => InkWell(
            onTap: () {
              controller.changeCat(i);
              controller.getItems("${i + 1}");
            },
            child: Categories(
                CategoriesModel.fromJson(controller.categories[i]), i)),
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final int index;
  final CategoriesModel categoriesModel;
  const Categories(this.categoriesModel, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(
        builder: (controller) => Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: controller.selectedCat == index
                          ? const Border(
                              bottom: BorderSide(
                                  width: 3, color: AppColor.primaryColor),
                            )
                          : null),
                  child: Text(
                    "${transName(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
                    style: const TextStyle(color: AppColor.gray),
                  ),
                ),
              ],
            ));
  }
}
