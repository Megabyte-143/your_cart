import 'package:flutter/material.dart';

import '../models/cart.dart';

class CartProvider with ChangeNotifier {
  final Map<String, Cart> _cartList = {};

  Map<String, Cart> get cartList {
    return _cartList;
  }

  double get totalAmt {
    var total = 0.0;
    _cartList.forEach((key, value) {
      total  = total+((value.price) * (value.quantity));
    });
    return total;
  }

  void addItemToCart(
    String id,
    double price,
    String imageUrl,
    String title,
  ) {
    if (_cartList.containsKey(id)) {
      _cartList.update(
          id,
          (existingItem) => Cart(
                id: id,
                imageUrl: imageUrl,
                price: price,
                quantity: existingItem.quantity + 1,
                title: title,
              ));
    } else {
      _cartList.putIfAbsent(
          id,
          () => Cart(
                id: DateTime.now().toString(),
                title: title,
                quantity: 1,
                price: price,
                imageUrl: imageUrl,
              ));
    }
    notifyListeners();
  }

  void removeItemFromCart(
    String id,
    double price,
    String imageUrl,
    String title,
  ) {
    if (_cartList.containsKey(id)) {
      _cartList.update(
          id,
          (existingItem) => Cart(
                id: id,
                imageUrl: imageUrl,
                price: price,
                quantity: existingItem.quantity - 1,
                title: title,
              ));
    }
    notifyListeners();
  }

  void deleteItem(String productId) {
    _cartList.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _cartList.clear();
    notifyListeners();
  }
}
