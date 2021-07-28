import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_cart/constant/my_icons.dart';

import '../../../../provider/dark_theme_provider.dart';

import '../../../../screens/cart/cart_screen.dart';
import '../../../../screens/feeds_screen.dart';

import 'button.dart';
import 'user_image.dart';

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
                Center(
                  child: BackLayerUserImage(),
                ),
                SizedBox(
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
                            _routeName(context, FeedsScreen.routeName);
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
