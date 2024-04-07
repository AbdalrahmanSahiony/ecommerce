import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeGrid extends StatelessWidget {
  final String imgUrl;
  final String text;
  void Function()? onTap;
  HomeGrid({super.key, required this.imgUrl, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: ListTile(
          title: Image.asset(
            imgUrl,
            height: 135,
          ),
          subtitle: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
