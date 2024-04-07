import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/onBordingController.dart';

class CustomButtomOnBording extends GetView<OnBordingControllerIm> {
  const CustomButtomOnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 60),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(7),
      ),
      child: MaterialButton(
        onPressed: () {
          controller.next();
        },
        child: const Text(
          "contenuie",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
