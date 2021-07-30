import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';

import '../../provider/product_list_provider.dart';

import '../../wigets/feeds_screen/feeds_screen_items.dart';

class ProductDetailScreenSuggestions extends StatelessWidget {
  const ProductDetailScreenSuggestions({Key? key, required this.catName})
      : super(key: key);
  final String catName;
  @override
  Widget build(BuildContext context) {
    final _products = Provider.of<ProductListProvider>(context);
    final List<Product> products = _products.findByCategory(catName);
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
