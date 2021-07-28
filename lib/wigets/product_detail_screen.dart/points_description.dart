import 'package:flutter/material.dart';

import 'double_text.dart';

class ProductDetailScreenPoints extends StatelessWidget {
  // const ProductDetailScreenPoints({
  //   Key? key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: const [
          ProductDetailScreenDoubleText(
            "Brand:",
            "Brand Name",
          ),
          ProductDetailScreenDoubleText(
            "Qunatity:",
            "Quantity Left",
          ),
          ProductDetailScreenDoubleText(
            "Category:",
            "Cat Name",
          ),
          ProductDetailScreenDoubleText(
            "Popularity:",
            "Popular",
          ),
        ],
      ),
    );
  }
}
