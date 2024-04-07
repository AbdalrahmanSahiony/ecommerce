import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/core/localeization/locale_conroller.dart';
import 'package:flutter_application_19/view/widgets/language/custom_change_button.dart';

class ChoseLanguage extends StatelessWidget {
  const ChoseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    LocalleController controller = Get.find();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "1".tr,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          CusttomChangeLanguage(
            onPressed: () {
              controller.changeLanguage("ar");
              Get.toNamed("/onBording");
            },
            buttomTitle: "Ar",
          ),
          const SizedBox(
            height: 10,
          ),
          CusttomChangeLanguage(
            onPressed: () {
              controller.changeLanguage("en");
              Get.toNamed("/onBording");
            },
            buttomTitle: "En",
          ),
        ]),
      ),
    );
  }
}
