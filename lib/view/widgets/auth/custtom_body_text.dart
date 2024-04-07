import 'package:flutter/material.dart';

class CusttomBodyText extends StatelessWidget {
  const CusttomBodyText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}
