import 'package:flutter/material.dart';

import '../../data/prduct_data.dart';

import '../../wigets/feeds_screen/feeds_screen_items.dart';

class ProductDetailScreenSuggestions extends StatelessWidget {
  const ProductDetailScreenSuggestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Suggest Products:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            width: double.infinity,
            height: 350,
            child: ListView.builder(
              itemBuilder: (ctx, i) {
                return FeedsScreenItems(i);
              },
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
