import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/cart_provider.dart';
import '../../provider/dark_theme_provider.dart';
import '../../provider/wishlist_provider.dart';

import 'bottom_buttons.dart';
import 'icons2.dart';

class ProductDetailSccreenBottomBar extends StatelessWidget {
  const ProductDetailSccreenBottomBar({
    Key? key,
    required this.id,
    required this.price,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);
  final String id;
  final double price;
  final String imageUrl;
  final String title;
  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final _cart = Provider.of<CartProvider>(context);
    final wishlist = Provider.of<WishlistProvider>(context);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ProductDetailScreenBottomBarButton(
              Icons.add_shopping_cart,
              _cart.cartList.containsKey(id)
                  ? () {}
                  : () {
                      _cart.addItemToCart(
                        id,
                        price,
                        imageUrl,
                        title,
                      );
                      print("added");
                    },
              _cart.cartList.containsKey(id) ? "In Cart" : "Add to Cart",
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
                wishlist.favsList.containsKey(id) ?Icons.favorite: Icons.favorite_outline,
                () => wishlist.addItemToWish(
                  id,
                  price,
                  imageUrl,
                  title,
                ),
                wishlist.favsList.containsKey(id) ? Colors.red : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
