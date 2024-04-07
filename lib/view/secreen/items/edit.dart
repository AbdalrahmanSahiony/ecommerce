import 'package:admin/controller/items/edit_controllew.dart';
import 'package:admin/core/classes/request_handling.dart';
import 'package:admin/core/function/validate.dart';
import 'package:admin/core/shared/form_field.dart';
import 'package:admin/view/widget/button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditItems extends StatelessWidget {
  const EditItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsEditController());

    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit categories"),
        ),
        body: GetBuilder<ItemsEditController>(
          builder: (controller) => ViewHandling(
              request: controller.stateRequest,
              widget: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Form(
                    key: controller.key,
                    child: ListView(
                      children: [
                        CusttomTextFormFieldGlobal(
                            text: "ctegories name",
                            hintText: "name",
                            validator: (val) {
                              return validit(val!, 100, 3, "none");
                            },
                            iconData: const Icon(Icons.abc),
                            controller: controller.name,
                            keybordType: TextInputType.text),
                        const SizedBox(height: 15),
                        CusttomTextFormFieldGlobal(
                            text: "ctegories name (Arabic)",
                            hintText: "name (Arabic)",
                            validator: (val) {
                              return validit(val!, 100, 3, "none");
                            },
                            iconData: const Icon(Icons.abc),
                            controller: controller.nameAr!,
                            keybordType: TextInputType.text),
                        const SizedBox(height: 15),
                        CusttomTextFormFieldGlobal(
                            text: "descrebtion",
                            hintText: "descrebtion",
                            validator: (val) {
                              return validit(val!, 1000, 5, "none");
                            },
                            iconData: const Icon(Icons.abc),
                            controller: controller.descrebtion!,
                            keybordType: TextInputType.text),
                        const SizedBox(height: 15),
                        CusttomTextFormFieldGlobal(
                            text: "descrebtion (Arabic)",
                            hintText: "descrebtion (Arabic)",
                            validator: (val) {
                              return validit(val!, 1000, 5, "none");
                            },
                            iconData: const Icon(Icons.abc),
                            controller: controller.descrebtionAr!,
                            keybordType: TextInputType.text),
                        const SizedBox(height: 15),
                        CusttomTextFormFieldGlobal(
                            text: "price",
                            hintText: "price",
                            iconData: const Icon(Icons.price_change),
                            validator: (val) {
                              return validit(val!, 10, 1, "numbe");
                            },
                            controller: controller.price!,
                            keybordType: TextInputType.number),
                        const SizedBox(height: 15),
                        CusttomTextFormFieldGlobal(
                            text: "discount",
                            hintText: "deiscount",
                            validator: (val) {
                              return validit(val!, 2, 1, "number");
                            },
                            iconData: const Icon(Icons.discount),
                            controller: controller.discount!,
                            keybordType: TextInputType.number),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            IconButton(
                                onPressed: () {
                                  controller.choseImage();
                                },
                                icon: const Icon(Icons.camera)),
                            IconButton(
                                onPressed: () {
                                  controller.choseImageCamera();
                                },
                                icon: const Icon(Icons.g_mobiledata)),
                          ],
                        ),
                        if (controller.file != null)
                          Image.file(
                            controller.file!,
                            height: 100,
                          ),
                        const SizedBox(height: 10),
                        RadioListTile(
                            title: const Text("Active"),
                            value: "1",
                            groupValue: controller.active,
                            onChanged: (val) {
                              controller.activeAndHideItem(val);
                            }),
                        RadioListTile(
                            title: const Text("Hide"),
                            value: "0",
                            groupValue: controller.active,
                            onChanged: (val) {
                              controller.activeAndHideItem(val);
                            }),
                        CusttomButtomAuth(
                            lable: "Edit",
                            onTap: () {
                              if (controller.validit()) {
                                controller.editItem();
                              }
                            })
                      ],
                    )),
              )),
        ));
  }
}
