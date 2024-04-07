import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/core/constans/routesString.dart';
import 'package:flutter_application_19/core/servecies/servecies.dart';
import 'package:flutter_application_19/data/data_source/static/static.dart';

abstract class OnBordingController extends GetxController {
  next();
  onPageChande(int index);
}

class OnBordingControllerIm extends OnBordingController {
  int currentPage = 0;
  late PageController pageController;
  MyServecies myServecies = Get.find();
  @override
  next() {
    currentPage++;
    if (currentPage > onBordingList.length - 1) {
      Get.toNamed(AppRoutes.logIn);
      MyServecies.sharedPreferences.setString("step", "1");
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(microseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChande(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
