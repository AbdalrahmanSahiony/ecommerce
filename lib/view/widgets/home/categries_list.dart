import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/home_controller.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';
import 'package:flutter_application_19/core/functions/teans_name.dart';
import 'package:flutter_application_19/data/model/categories_model.dart';

class CategoriesList extends GetView<HomeControllerIm> {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, i) => InkWell(
            onTap: () {
              controller.goToItems(controller.categories, i,
                  controller.categories[i]["categories_id"].toString());
            },
            child:
                Categories(CategoriesModel.fromJson(controller.categories[i]))),
      ),
    );
  }
}

class Categories extends GetView<HomeControllerIm> {
  final CategoriesModel categoriesModel;
  const Categories(this.categoriesModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          width: 90,
          padding: const EdgeInsets.symmetric(vertical: 10),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
              color: AppColor.thirdColor,
              borderRadius: BorderRadius.circular(20)),
          child: SvgPicture.network(
            "${AppLink.categoriesImage}/${categoriesModel.categoriesImage}",
            // ignore: deprecated_member_use
            color: AppColor.secondColor,
          ),
        ),
        Text(
          "${transName(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
        ),
      ],
    );
  }
}
