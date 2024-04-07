import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/home_secreen_controller.dart';
import 'package:flutter_application_19/view/widgets/home/costtum_buttom_appbar_button.dart';

class HomeButtomAppBar extends StatefulWidget {
  const HomeButtomAppBar({super.key});

  @override
  State<HomeButtomAppBar> createState() => _HomeButtomAppBarState();
}

class _HomeButtomAppBarState extends State<HomeButtomAppBar> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeSecreenControllerImp>(
        builder: (controller) => BottomAppBar(
              shape: const CircularNotchedRectangle(),
              child: Row(children: [
                ...List.generate(controller.pages.length + 1, (index) {
                  int i = index > 2 ? index - 1 : index;
                  return index == 2
                      ? const Spacer()
                      : ButtomAppBarButton(
                          textButton: controller.buttons[i]["text"],
                          icon: controller.buttons[i]["icon"],
                          active:
                              index > 2 && controller.currentPage == index - 1
                                  ? true
                                  : index < 2 && controller.currentPage == index
                                      ? true
                                      : false,
                          onPressed: () {
                            controller.changePage(i);
                          });
                })
              ]),
            ));
  }
}
