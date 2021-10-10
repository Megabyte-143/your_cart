import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';

import '../../provider/product_list_provider.dart';

import '../../widgets/inner_screen/category/category_feeds_items.dart';

class CategoryInnerScreen extends StatelessWidget {
  static const routeName = '/category-inner-screen';

  @override
  Widget build(BuildContext context) {
    final _categoryItems =
        Provider.of<ProductListProvider>(context, listen: false);
    final categoryName = ModalRoute.of(context)!.settings.arguments;
    print(categoryName);

    final List<Product> categoryItem =
        _categoryItems.findByCategory(categoryName.toString());

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      //appBar: AppBar(),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 6,
        itemCount: categoryItem.length,
        shrinkWrap: true,
        itemBuilder: (ctx, index) => Container(
          child: CategoryFeedsItems(
            index,
            categoryName.toString(),
          ),
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
