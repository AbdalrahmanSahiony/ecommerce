import 'package:flutter/material.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';

class CusttomButtomAuth extends StatelessWidget {
  const CusttomButtomAuth(
      {super.key, required this.lable, required this.onTap});
  final String lable;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, bottom: 15),
      height: 40,
      child: MaterialButton(
        onPressed: () {
          onTap();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: AppColor.primaryColor,
        child: Text(
          lable,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
