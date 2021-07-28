import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../data/prduct_data.dart';

import '../wigets/feeds_screen/feeds_screen_items.dart';

class FeedsScreen extends StatelessWidget {
  static const routeName = '/feeds-screen';

  @override
  Widget build(BuildContext context) {
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
            const StaggeredTile.count(3, 5.4),
        mainAxisSpacing: 4,
        crossAxisSpacing: 6,
      ),
    );
  }
}
