import 'package:admin/controller/items/add_controller.dart';
import 'package:admin/core/classes/request_handling.dart';
import 'package:admin/core/function/validate.dart';
import 'package:admin/core/shared/form_field.dart';
import 'package:admin/core/shared/list_drop_down.dart';
import 'package:admin/view/widget/button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddItems extends StatelessWidget {
  const AddItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsAddController());

    return Scaffold(
        appBar: AppBar(
          title: const Text("Add items"),
        ),
        body: GetBuilder<ItemsAddController>(
          builder: (controller) => ViewHandling(
              request: controller.stateRequest,
              widget: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Form(
                    key: controller.key,
                    child: ListView(
                      children: [
                        const SizedBox(height: 10),
                        CusttomTextFormFieldGlobal(
                            text: "items name",
                            hintText: "name",
                            validator: (val) {
                              return validit(val!, 100, 3, "none");
                            },
                            iconData: const Icon(Icons.abc),
                            controller: controller.name,
                            keybordType: TextInputType.text),
                        const SizedBox(height: 15),
                        CusttomTextFormFieldGlobal(
                            text: "items name (Arabic)",
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
                        const SizedBox(
                          height: 15,
                        ),
                        DropDownList(
                          name: controller.nameList,
                          id: controller.idList,
                          title: "Chosse category",
                          dropDownListItems: controller.dropListItems,
                        ),
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
                        const SizedBox(height: 15),
                        CusttomButtomAuth(
                            lable: "Add",
                            onTap: () {
                              if (controller.validit()) {
                                controller.addcItems();
                              }
                            })
                      ],
                    )),
              )),
        ));
  }
}
