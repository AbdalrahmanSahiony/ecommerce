import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter_application_19/controller/onBordingController.dart';
import 'package:flutter_application_19/data/data_source/static/static.dart';

class ControllerDoteOnBording extends StatelessWidget {
  const ControllerDoteOnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBordingControllerIm>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onBordingList.length,
              (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: controller.currentPage == index ? 15 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    margin: const EdgeInsets.only(right: 6, bottom: 80),
                  )),
        ],
      ),
    );
  }
}
