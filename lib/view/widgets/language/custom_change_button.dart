import 'package:flutter/material.dart';

class CusttomChangeLanguage extends StatelessWidget {
  const CusttomChangeLanguage(
      {super.key, required this.buttomTitle, required this.onPressed});
  final String buttomTitle;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 15),
      onPressed: () {
        onPressed();
      },
      child: Text(
        buttomTitle,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
