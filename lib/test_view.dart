import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/test_controller.dart';
import 'package:flutter_application_19/core/classes/view_handling.dart';
import 'package:flutter_application_19/core/constans/theme.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("test"),
          backgroundColor: themeEnglish.primaryColor,
        ),
        body: GetBuilder<TestController>(builder: (controller) {
          return ViewHandling(
              request: controller.stateRequest,
              widget: ListView.builder(itemBuilder: (context, index) {
                return Text("${controller.data}");
              }));
        }));
  }
}
