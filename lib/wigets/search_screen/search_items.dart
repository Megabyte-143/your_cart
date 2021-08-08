import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_cart/wigets/feeds_screen/feeds.dart';

import '../../models/product.dart';

import '../../provider/dark_theme_provider.dart';
import '../../provider/product_list_provider.dart';

class SearchScreenItems extends StatefulWidget {
  const SearchScreenItems(this.index, this.searchText);

  final int index;
  final String searchText;

  @override
  _SearchScreenItemsState createState() => _SearchScreenItemsState();
}

class _SearchScreenItemsState extends State<SearchScreenItems> {
  @override
  Widget build(BuildContext context) {
    final _products = Provider.of<ProductListProvider>(context);
    final List<Product> _product = _products.findBySearch(widget.searchText);
    final product = _product[widget.index];
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Feeds(
      darkTheme: darkTheme,
      product: product,
    );
  }
}
