import 'package:delivery/core/const/colors.dart';
import 'package:flutter/material.dart';

class ButtomAppBarButton extends StatelessWidget {
  final void Function()? onPressed;
  final String textButton;
  final IconData icon;
  final bool active;
  const ButtomAppBarButton({
    super.key,
    this.onPressed,
    required this.textButton,
    required this.icon,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: active ? AppColor.primaryColor : AppColor.gray,
            ),
            Text(
              textButton,
              style: TextStyle(
                color: active ? AppColor.primaryColor : AppColor.gray,
              ),
            ),
          ],
        ));
  }
}
