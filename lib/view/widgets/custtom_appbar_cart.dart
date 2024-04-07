import 'package:flutter/material.dart';

class CosttumAppbarCart extends StatelessWidget {
  final String title;
  const CosttumAppbarCart({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
            )),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 40),
            alignment: Alignment.center,
            child: Text(title,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
          ),
        ),
      ],
    );
  }
}
