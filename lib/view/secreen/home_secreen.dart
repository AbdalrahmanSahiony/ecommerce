import 'package:delivery/controller/homeSecreen_controller.dart';
import 'package:delivery/view/widget/bottum_nevagetion_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeSecreen extends StatelessWidget {
  const HomeSecreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Orders"),
        ),
        bottomNavigationBar: const BottumBar(),
        body: controller.pages[controller.currentPage],
      );
    });
  }
}
