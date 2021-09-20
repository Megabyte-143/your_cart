import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/my_icons.dart';

import '../../provider/cart_provider.dart';
import '../../provider/wishlist_provider.dart';

import '../../screens/cart/cart_screen.dart';
import '../../screens/user_info_screen.dart';
import '../../screens/wishlist/wishlist_screen.dart';

import '../../wigets/product_detail_screen.dart/icons1.dart';

class SearchHeader extends SliverPersistentHeaderDelegate {
  SearchHeader({
    required this.search,
    this.flexibleSpace = 250,
  });

  final double flexibleSpace;
  final Widget search;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    const double contHeight = 300;
    return SizedBox(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: contHeight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black12,
                  Colors.white12,
                ],
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: Consumer<WishlistProvider>(
                    builder: (_, wish, ch) => ProductDetailScreenAppBarIcons(
                      MyIcons.wishList,
                      () {
                        Navigator.of(context)
                            .pushNamed(WishlistScreen.routename);
                      },
                      Colors.amber,
                      wish.favsList.length,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 10),
                  child: Consumer<CartProvider>(
                    builder: (_, cart, ch) => ProductDetailScreenAppBarIcons(
                      MyIcons.cart,
                      () {
                        Navigator.of(context).pushNamed(CartScreen.routename);
                      },
                      Colors.amber,
                      cart.cartList.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 35,
            left: 15,
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(10.0),
                onTap: () {
                  Navigator.of(context).pushNamed(UserInfoScreen.routeName);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/user.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 140,
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                "Search",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          Container(
            height: contHeight,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 20,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: search,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => flexibleSpace;

  @override
  double get minExtent => kToolbarHeight + 25;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
