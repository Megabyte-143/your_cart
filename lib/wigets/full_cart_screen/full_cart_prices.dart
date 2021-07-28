import 'package:flutter/material.dart';

class FullCartPrices extends StatelessWidget {
  //const FullCartPrices({ Key? key }) : super(key: key);

  const FullCartPrices(this.price, this.priceValue, this.colorData);

  final String price;
  final double priceValue;
  final Color colorData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(price),
        Text(
          '$priceValue',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: colorData,
          ),
        )
      ],
    );
  }
}
