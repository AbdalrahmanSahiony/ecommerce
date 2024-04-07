import 'package:flutter/material.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';

class DeliveryWay extends StatelessWidget {
  final String deliveryType;
  final String imageName;
  final bool isActive;
  final Function()? onTap;
  const DeliveryWay(
      {super.key,
      required this.deliveryType,
      required this.imageName,
      required this.isActive,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 140,
          width: 140,
          decoration: BoxDecoration(
            color: isActive ? AppColor.primaryColor : null,
            border: Border.all(color: AppColor.secondColor),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isActive)
                Image.asset(
                  imageName,
                  height: 100,
                ),
              Text(
                deliveryType,
                style: TextStyle(
                    color: isActive ? Colors.white : AppColor.primaryColor,
                    fontWeight: FontWeight.bold),
                textAlign: !isActive ? TextAlign.center : null,
              )
            ],
          )),
    );
  }
}
