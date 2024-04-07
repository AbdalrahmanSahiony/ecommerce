import 'package:flutter/material.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';

class CusttomButtom extends StatelessWidget {
  const CusttomButtom({super.key, required this.lable, required this.onTap});
  final String lable;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 7, left: 7),
      height: 50,
      child: MaterialButton(
        onPressed: () {
          onTap();
        },
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
