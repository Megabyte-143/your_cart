import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../models/product.dart';

import '../../../../../provider/cart_provider.dart';
import '../../../../../provider/dark_theme_provider.dart';
import '../../../../../provider/wishlist_provider.dart';

import '../../../../../screens/product_detail_screen.dart';

class HomeScreenPopularProducts extends StatelessWidget {
  const HomeScreenPopularProducts(this.product);
  final Product product;
  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final cart = Provider.of<CartProvider>(context);
    final wishlist = Provider.of<WishlistProvider>(context);
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(ProductDetailScreen.routeName, arguments: product.id),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 250,
        height: 400,
        child: Column(
          children: [
            Container(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          product.imageUrl,
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.star),
                      onPressed: () => wishlist.addItemToWish(
                        product.id,
                        product.price,
                        product.imageUrl,
                        product.title,
                      ),
                      color: wishlist.favsList.containsKey(product.id)
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        '\$ ${product.price}',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      product.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: darkTheme ? Colors.yellow : Colors.purple,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        child: Text(
                          product.description,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: cart.cartList.containsKey(product.id)
                              ? () {}
                              : () {
                                  print("added");
                                  cart.addItemToCart(
                                    product.id,
                                    product.price,
                                    product.imageUrl,
                                    product.title,
                                  );
                                },
                          child: Icon(
                            cart.cartList.containsKey(product.id)
                                ? Icons.check
                                : Icons.add_shopping_cart_outlined,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
