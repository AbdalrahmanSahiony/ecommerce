import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/onBordingController.dart';
import 'package:flutter_application_19/data/data_source/static/static.dart';

class CustomPageView extends GetView<OnBordingControllerIm> {
  const CustomPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        onPageChanged: (index) => controller.onPageChande(index),
        controller: controller.pageController,
        itemCount: onBordingList.length,
        itemBuilder: (ctx, i) => Column(
              children: [
                Text(
                  onBordingList[i].title!,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 40,
                ),
                Image.asset(
                  onBordingList[i].imageUrl!,
                  height: Get.height / 3,
                  width: Get.width / 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  onBordingList[i].body!,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ));
  }
}
