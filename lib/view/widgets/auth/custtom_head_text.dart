import 'package:flutter/material.dart';

class CusttomHeadText extends StatelessWidget {
  const CusttomHeadText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontSize: 26, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}
