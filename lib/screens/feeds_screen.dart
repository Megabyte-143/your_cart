import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../wigets/feeds_screen/feeds_screen_items.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Theme.of(context).backgroundColor,
        //appBar: AppBar(),
        body: StaggeredGridView.countBuilder(
          crossAxisCount: 6,
          itemCount: 8,
          itemBuilder: (ctx, i) => Container(
            child: FeedsScreenItems(),
          ),
          staggeredTileBuilder: (i) => StaggeredTile.count(3, i.isEven?4.8: 5),
          mainAxisSpacing: 2,
          crossAxisSpacing: 4,
        ));
  }
}
