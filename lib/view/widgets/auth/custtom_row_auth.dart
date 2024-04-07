import 'package:flutter/material.dart';

class CusttomRawAuth extends StatelessWidget {
  const CusttomRawAuth(
      {super.key,
      required this.stringOne,
      required this.stringTow,
      this.onTap});
  final String stringOne;
  final String stringTow;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          stringOne,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.grey),
        ),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: () {
            onTap!();
          },
          child: Text(
            stringTow,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.deepOrange),
          ),
        )
      ],
    );
  }
}
