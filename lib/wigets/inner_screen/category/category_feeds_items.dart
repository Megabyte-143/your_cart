import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';

import '../../../provider/dark_theme_provider.dart';
import '../../../provider/product_list_provider.dart';

import '../../feeds.dart';

class CategoryFeedsItems extends StatefulWidget {
  const CategoryFeedsItems(
    this.index,
    this.catName,
  );

  final int index;
  final String catName;

  @override
  _CategoryFeedsItemsState createState() => _CategoryFeedsItemsState();
}

class _CategoryFeedsItemsState extends State<CategoryFeedsItems> {
  @override
  Widget build(BuildContext context) {
    final _categories = Provider.of<ProductListProvider>(context);
    final List<Product> _categoryProducts = _categories.findByCategory(widget.catName);
    final categoryProduct = _categoryProducts[widget.index];
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Feeds(darkTheme: darkTheme, product: categoryProduct);
  }
}
