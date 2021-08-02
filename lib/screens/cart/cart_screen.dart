import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/cart_provider.dart';

import 'empty_cart_screen.dart';
import 'full_cart_screen.dart';

class CartScreen extends StatelessWidget {
  // const CartScreen({Key? key}) : super(key: key);
  static const routename = '/cart-screen';
  @override
  Widget build(BuildContext context) {
    final cartList = Provider.of<CartProvider>(context);
    final int cartListLength = cartList.cartList.length;
    return cartList.cartList.isEmpty
        ? EmptyCartScreen()
        : FullCartScreen(
            cartListLength: cartListLength,
          );
  }
}
