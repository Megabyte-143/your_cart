import 'package:flutter/material.dart';

import 'icons.dart';

class ProductDetailScreenDoubleIcons extends StatelessWidget {
  const ProductDetailScreenDoubleIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ProductDetailScreenIcons(
            Icons.save,
            () {},
            Colors.amber,
          ),
          const SizedBox(
            width: 10,
          ),
          ProductDetailScreenIcons(
            Icons.share,
            () {},
            Colors.amber,
          ),
        ],
      ),
    );
  }
}

