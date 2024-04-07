import 'package:flutter/material.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';

class PaymentWay extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function()? onTap;

  const PaymentWay(
      {super.key, required this.title, required this.isActive, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 21),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: isActive ? AppColor.primaryColor : AppColor.thirdColor,
            borderRadius: BorderRadius.circular(50)),
        child: Text(
          title,
          style: TextStyle(
              color: isActive ? Colors.white : AppColor.primaryColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
