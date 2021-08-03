import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../constant/my_icons.dart';

import '../models/product.dart';

import '../provider/cart_provider.dart';
import '../provider/product_list_provider.dart';
import '../provider/wishlist_provider.dart';

import '../wigets/feeds_screen/feeds_screen_items.dart';
import '../wigets/product_detail_screen.dart/icons1.dart';

class FeedsScreen extends StatelessWidget {
  static const routeName = '/feeds-screen';

  @override
  Widget build(BuildContext context) {
    final _products = Provider.of<ProductListProvider>(context);
    List<Product> products = _products.products;
    final popular = ModalRoute.of(context)!.settings.arguments;
    if (popular == "popular") {
      products = _products.findByPopularity();
    }
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: const Text("Detail"),
        centerTitle: true,
        bottomOpacity: 0.5,
        actions: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Consumer<WishlistProvider>(
              builder: (_, wish, ch) => ProductDetailScreenAppBarIcons(
                MyIcons.wishList,
                () {},
                Colors.amber,
                wish.favsList.length,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(right: 10),
            child: Consumer<CartProvider>(
              builder: (_, cart, ch) => ProductDetailScreenAppBarIcons(
                MyIcons.cart,
                () {},
                Colors.amber,
                cart.cartList.length,
              ),
            ),
          ),
        ],
      ),
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
