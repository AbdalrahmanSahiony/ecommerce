import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/home_secreen_controller.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';
import 'package:flutter_application_19/view/widgets/custtom_home_buttom_app_bar.dart';

class HomeSecreen extends StatelessWidget {
  const HomeSecreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeSecreenControllerImp());
    return GetBuilder<HomeSecreenControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ElevatedButton(
            onPressed: () {
              controller.goTOCart();
            },
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: AppColor.primaryColor,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: const HomeButtomAppBar(),
        /* Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ButtomAppBarButton(
                        textButton: "Home",
                        icon: Icons.home,
                        onPressed: () {
                          controller.changePage(0);
                        },
                        active: controller.currentPage == 0 ? true : false),
                    ButtomAppBarButton(
                        textButton: "Settings",
                        onPressed: () {
                          controller.changePage(1);
                        },
                        icon: Icons.settings,
                        active: controller.currentPage == 1 ? true : false),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ButtomAppBarButton(
                        textButton: "h",
                        icon: Icons.home,
                        onPressed: () {
                          controller.changePage(2);
                        },
                        active: controller.currentPage == 2 ? true : false),
                    ButtomAppBarButton(
                        textButton: "h",
                        onPressed: () {
                          controller.changePage(3);
                        },
                        icon: Icons.home,
                        active: controller.currentPage == 3 ? true : false),
                  ],
                ),*/

        body: WillPopScope(
            onWillPop: () => controller.alertExitApp(),
            child: controller.pages.elementAt(controller.currentPage)),
      ),
    );
  }
}
