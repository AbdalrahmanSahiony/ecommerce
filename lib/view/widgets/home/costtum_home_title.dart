import 'package:flutter/material.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';

class CosttumHomeTitle extends StatelessWidget {
  final String title;
  const CosttumHomeTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColor.primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }
}
