import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/dark_theme_provider.dart';

import 'bottom_buttons.dart';
import 'icons.dart';

class ProductDetailSccreenBottomBar extends StatelessWidget {
  const ProductDetailSccreenBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ProductDetailScreenBottomBarButton(
              Icons.add_shopping_cart,
              () {},
              "Add to Cart",
              darkTheme ? Colors.red : Colors.redAccent,
            ),
          ),
          Expanded(
            flex: 2,
            child: ProductDetailScreenBottomBarButton(
              Icons.now_widgets,
              () {},
              "Buy Now",
              darkTheme ? Colors.green : Colors.greenAccent,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white38,
              height: 50,
              child: ProductDetailScreenIcons(
                Icons.favorite_outline_outlined,
                () {},
                Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
