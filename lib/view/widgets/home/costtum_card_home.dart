import 'package:flutter/material.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';

class CosttumCardHome extends StatelessWidget {
  final String title;
  final String body;
  const CosttumCardHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColor.primaryColor),
          height: 150,
          child: ListTile(
            title: Text(title),
            textColor: Colors.white,
            subtitle: Text(
              body,
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
