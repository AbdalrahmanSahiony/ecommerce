import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CusttomTextFormFieldGlobal extends StatelessWidget {
  CusttomTextFormFieldGlobal(
      {super.key,
      required this.text,
      required this.hintText,
      required this.iconData,
      this.controller,
      this.validator,
      required this.keybordType,
      this.obscureText,
      this.onTap,
      this.icon,
      this.onSave,
      this.onChanged});
  final String text;
  final String hintText;
  final Icon iconData;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keybordType;
  final bool? obscureText;
  final Function()? onTap;
  final String? Function(String?)? onSave;
  final Widget? icon;
  void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSave,
      validator: validator,
      keyboardType: keybordType,
      obscureText: obscureText == true ? true : false,
      onChanged: onChanged,
      decoration: InputDecoration(
          label: Container(margin: const EdgeInsets.all(15), child: Text(text)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          icon: icon,
          suffixIcon: InkWell(
            onTap: onTap,
            child: iconData,
          ),
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.grey)),
    );
  }
}
