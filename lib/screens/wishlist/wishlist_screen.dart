import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/wishlist_provider.dart';

import 'empty_wishlist_screen.dart';
import 'full_wishlist_screen.dart';

class WishlistScreen extends StatelessWidget {
  // const CartScreen({Key? key}) : super(key: key);
  static const routename = '/wishlist-screen';
  @override
  Widget build(BuildContext context) {
    final wishList = Provider.of<WishlistProvider>(context);
    return wishList.favsList.isEmpty
        ? EmptyWishlistScreen()
        : const FullWishlistScreen();
  }
}
