import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/controller/onBordingController.dart';
import 'package:flutter_application_19/view/widgets/onBording/controllerDote.dart';
import 'package:flutter_application_19/view/widgets/onBording/customButton.dart';
import 'package:flutter_application_19/view/widgets/onBording/customPageView.dart';

class OnBording extends StatelessWidget {
  const OnBording({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBordingControllerIm());
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomPageView(),
          ),
          ControllerDoteOnBording(),
          CustomButtomOnBording(),
        ],
      ),
    );
  }
}
