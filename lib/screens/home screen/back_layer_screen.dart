import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/my_icons.dart';

import '../../provider/dark_theme_provider.dart';

import '../../wigets/home_screen/layers/back_layer/button.dart';
import '../../wigets/home_screen/layers/back_layer/user_image.dart';

import '../cart/cart_screen.dart';

import '../feeds_screen.dart';

import '../wishlist/wishlist_screen.dart';

class HomeScreenBackLayer extends StatelessWidget {
  const HomeScreenBackLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Container(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: darkTheme ? Colors.grey.shade600 : Colors.grey.shade400,
          ),
          width: double.infinity,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: BackLayerUserImage(),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: Container(
                    width: 200,
                    child: Column(
                      children: [
                        BackLayerButton(
                          'Feeds',
                          () {
                            _routeName(context, FeedsScreen.routeName);
                          },
                          MyIcons.rss,
                        ),
                        BackLayerButton(
                          'Cart',
                          () {
                            _routeName(context, CartScreen.routename);
                          },
                          MyIcons.cart,
                        ),
                        BackLayerButton(
                          'Wishlist',
                          () {
                            _routeName(context, WishlistScreen.routename);
                          },
                          MyIcons.wishList,
                        ),
                        BackLayerButton(
                          'Upload New Product',
                          () {
                            _routeName(context, FeedsScreen.routeName);
                          },
                          MyIcons.upload,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _routeName(BuildContext ctx, String routeName) {
    Navigator.of(ctx).pushNamed(routeName);
  }
}
