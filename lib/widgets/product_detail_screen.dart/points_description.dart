import 'package:flutter/material.dart';

import 'double_text.dart';

class ProductDetailScreenPoints extends StatelessWidget {
  // const ProductDetailScreenPoints({
  //   Key? key,
  // }) : super(key: key);
  const ProductDetailScreenPoints({
    Key? key,
    required this.brandName,
    required this.catName,
    required this.popularity,
    required this.quantity,
  }) : super(key: key);

  final String brandName;
  final String catName;
  final String popularity;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          ProductDetailScreenDoubleText(
            "Brand:",
            brandName,
          ),
          ProductDetailScreenDoubleText(
            "Qunatity:",
            "$quantity Left",
          ),
          ProductDetailScreenDoubleText(
            "Category:",
            catName,
          ),
          ProductDetailScreenDoubleText(
            "Popularity:",
            popularity,
          ),
        ],
      ),
    );
  }
}
