import 'package:flutter/widgets.dart';

class PriceAndTotaPriceCart extends StatelessWidget {
  final String titlePrice;
  final String price;
  final Color colorPrice;
  const PriceAndTotaPriceCart(
      {super.key,
      required this.titlePrice,
      required this.price,
      required this.colorPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titlePrice,
            style: TextStyle(fontSize: 23, color: colorPrice),
          ),
          Text(
            price,
            style: TextStyle(fontSize: 23, color: colorPrice),
          ),
        ],
      ),
    );
  }
}
