import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

import '../provider/product_list_provider.dart';

import '../wigets/feeds_screen/feeds_screen_items.dart';

class FeedsScreen extends StatelessWidget {
  static const routeName = '/feeds-screen';

  @override
  Widget build(BuildContext context) {
    final _products = Provider.of<ProductListProvider>(context);
    final List<Product> products = _products.products;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      //appBar: AppBar(),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 6,
        itemCount: products.length,
        shrinkWrap: true,
        itemBuilder: (ctx, index) => Container(
          child: FeedsScreenItems(index),
        ),
        addRepaintBoundaries: true,
        addAutomaticKeepAlives: true,
        staggeredTileBuilder: (i) =>
            StaggeredTile.count(3, i.isEven ? 5.8 : 5.4),
        mainAxisSpacing: 1,
        crossAxisSpacing: 6,
      ),
    );
  }
}
