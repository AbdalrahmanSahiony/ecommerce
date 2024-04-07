import 'package:flutter/material.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';

class AddressCard extends StatelessWidget {
  final String title;
  final String bodyText;
  final bool isActive;
  final Function()? onTap;
  const AddressCard(
      {super.key,
      required this.title,
      required this.bodyText,
      required this.isActive,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: isActive ? AppColor.primaryColor : null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(color: isActive ? Colors.white : null),
          ),
          subtitle: Text(
            bodyText,
            style: TextStyle(color: isActive ? Colors.white : null),
          ),
        ),
      ),
    );
  }
}
