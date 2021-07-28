import 'package:flutter/material.dart';

import 'empty_wishlist_screen.dart';
import 'full_wishlist_screen.dart';

class WishlistScreen extends StatelessWidget {
  // const CartScreen({Key? key}) : super(key: key);
  static const routename = '/wishlist-screen';
  @override
  Widget build(BuildContext context) {
    final List cartItems = [];
    return cartItems.isEmpty ? EmptyWishlistScreen() : const FullWishlistScreen();
  }
}
