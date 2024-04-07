import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "alert",
      middleText: "Do you want exit from app",
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: const Text("confirm")),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("cancel")),
      ]);
  // the used widget requier future function
  return Future.value(true);
}
