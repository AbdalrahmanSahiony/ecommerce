import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/items_details_controller.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';

class ColorContainers extends GetView<ItemsDetailsImp> {
  const ColorContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ...List.generate(
          3,
          (index) => Container(
            margin: const EdgeInsets.only(left: 10, top: 10),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: controller.clorContainers[index]["active"]
                  ? AppColor.blackBlue
                  : null,
              border: Border.all(color: AppColor.blackBlue),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                controller.clorContainers[index]["name"],
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: controller.clorContainers[index]["active"]
                        ? Colors.white
                        : Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
