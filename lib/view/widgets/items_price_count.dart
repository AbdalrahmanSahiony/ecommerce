import 'package:flutter/material.dart';
import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/core/constans/app_color.dart';

class PriceCount extends StatelessWidget {
  final String price;
  final String count;
  final Function() onPressedAdd;
  final Function() onPressedRemove;
  final ConectionState statuseRequest;
  const PriceCount(
      {super.key,
      required this.price,
      required this.count,
      required this.onPressedAdd,
      required this.onPressedRemove,
      required this.statuseRequest});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(price,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: AppColor.primaryColor,
                )),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(onPressed: onPressedAdd, icon: const Icon(Icons.add)),
            statuseRequest == ConectionState.loading
                ? const CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  )
                : Container(
                    alignment: Alignment.topCenter,
                    width: 60,
                    height: 30,
                    //padding: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.black)),
                    child: Text(
                      count,
                      style: const TextStyle(height: 1.5),
                    ),
                  ),
            IconButton(
                onPressed: onPressedRemove, icon: const Icon(Icons.remove)),
          ],
        )
      ],
    );
  }
}
