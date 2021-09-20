import 'package:flutter/material.dart';

import '../models/wishlist.dart';

class WishlistProvider with ChangeNotifier {
  final Map<String, Wishlist> _favsList = {};

  Map<String, Wishlist> get favsList {
    return _favsList;
  }

  void addItemToWish(
    String productId,
    double price,
    String imageUrl,
    String title,
  ) {
    if (_favsList.containsKey(productId)) {
      deleteItem(productId);
    } else {
      _favsList.putIfAbsent(
        productId,
        () => Wishlist(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          imageUrl: imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  // void removeItemFromWish(
  //   String id,
  //   double price,
  //   String imageUrl,
  //   String title,
  // ) {
  //   if (_favsList.containsKey(id)) {
  //     _favsList.update(
  //         id,
  //         (existingItem) => Wishlist(
  //               id: id,
  //               imageUrl: imageUrl,
  //               price: price,
  //               title: title,
  //             ));
  //   }
  //   notifyListeners();
  // }

  void deleteItem(String productId) {
    _favsList.remove(productId);
    notifyListeners();
  }

  void clearWish() {
    _favsList.clear();
    notifyListeners();
  }
}
