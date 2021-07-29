import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';

import '../../provider/dark_theme_provider.dart';
import '../../provider/product_list_provider.dart';

import '../feeds.dart';

class FeedsScreenItems extends StatefulWidget {
  const FeedsScreenItems(this.index);

  final int index;

  @override
  _FeedsScreenItemsState createState() => _FeedsScreenItemsState();
}

class _FeedsScreenItemsState extends State<FeedsScreenItems> {
  @override
  Widget build(BuildContext context) {
    final _products = Provider.of<ProductListProvider>(context);
    final List<Product> _product = _products.products;
    final product = _product[widget.index];
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Feeds(darkTheme: darkTheme, product: product);
  }
}

