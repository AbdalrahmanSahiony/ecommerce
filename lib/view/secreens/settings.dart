import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/settings_controller.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';
import 'package:flutter_application_19/core/constans/image_assets.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return GetBuilder<SettingsController>(builder: (controller) {
      return ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: Get.width / 2,
                color: AppColor.primaryColor,
              ),
              Positioned(
                  top: Get.width / 2.4,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                      backgroundImage: AssetImage(AppImageAssets.avatar),
                    ),
                  )),
            ],
          ),
          const SizedBox(height: 70),
          Container(
            padding: const EdgeInsets.all(10),
            child: Card(
              child: Column(children: [
                ...List.generate(controller.settings.length, (index) {
                  return ListTile(
                    title: controller.settings[index]["text"],
                    trailing: controller.settings[index]["icon"],
                  );
                }),
              ]),
            ),
          )
        ],
      );
    });
  }
}
