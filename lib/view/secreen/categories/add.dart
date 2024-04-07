import 'package:admin/controller/categories/add_categories.dart';
import 'package:admin/core/classes/request_handling.dart';
import 'package:admin/core/constant/colors.dart';
import 'package:admin/core/shared/form_field.dart';
import 'package:admin/view/widget/button_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddCategories extends StatelessWidget {
  const AddCategories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesAddController());

    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Categories"),
        ),
        body: GetBuilder<CategoriesAddController>(
          builder: (controller) => ViewHandling(
            request: controller.stateRequest,
            widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: ListView(
                children: [
                  CusttomTextFormFieldGlobal(
                      text: "ctegories name",
                      hintText: "name",
                      iconData: const Icon(Icons.category_outlined),
                      controller: controller.name!,
                      keybordType: TextInputType.text),
                  const SizedBox(height: 20),
                  CusttomTextFormFieldGlobal(
                      text: "ctegories name (Arabic)",
                      hintText: "name (Arabic)",
                      iconData: const Icon(Icons.category_outlined),
                      controller: controller.nameAr!,
                      keybordType: TextInputType.text),
                  const SizedBox(height: 20),
                  TextButton(
                      onPressed: () {
                        controller.choseImage();
                      },
                      child: Text(
                        "select categories image",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppColor.primaryColor),
                      )),
                  if (controller.file != null)
                    SvgPicture.file(
                      controller.file!,
                      height: 100,
                    ),
                  const SizedBox(height: 10),
                  CusttomButtomAuth(
                      lable: "Add",
                      onTap: () {
                        controller.addCategories();
                      })
                ],
              ),
            ),
          ),
        ));
  }
}
