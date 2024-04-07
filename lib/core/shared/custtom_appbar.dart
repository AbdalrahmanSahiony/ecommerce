import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CostuumAppBar extends StatelessWidget {
  final String title;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  const CostuumAppBar({
    super.key,
    required this.title,
    required this.onPressedSearch,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: TextFormField(
            onChanged: onChanged,
            controller: controller,
            decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: onPressedSearch,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: title,
                hintStyle: const TextStyle(fontSize: 18),
                filled: true,
                fillColor: Colors.grey[200]),
          ),
        ),
      ],
    );
  }
}
