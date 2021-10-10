import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';

import '../../provider/cart_provider.dart';
import '../../provider/wishlist_provider.dart';

import '../../screens/product_detail_screen.dart';

import 'dialog_icons.dart';

class FeedsScreenDialog extends StatelessWidget {
  const FeedsScreenDialog({Key? key, required this.product, required this.ctx})
      : super(key: key);
  final Product product;
  final BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        //padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).backgroundColor,
        ),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.55,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                constraints: BoxConstraints(
                  minHeight: 100,
                  maxHeight: MediaQuery.of(context).size.height * 0.4,
                ),
                decoration: BoxDecoration(
                  // image: DecorationImage(
                  //   image: AssetImage(
                  //     'assets/images/apple.jpg',

                  //   ),
                  //   colorFilter: ColorFilter.linearToSrgbGamma(),
                  //   fit: BoxFit.contain,
                  // ),
                  //color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image(
                  image: NetworkImage(
                    product.imageUrl,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Consumer<WishlistProvider>(
                      builder: (ctx, favs, ch) => DialogIcons(
                        icon: favs.favsList.containsKey(product.id)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        label: "Add to Wishlist",
                        onTap: () => favs.addItemToWish(
                          product.id,
                          product.price,
                          product.imageUrl,
                          product.title,
                        ),
                      ),
                    ),
                    DialogIcons(
                      icon: Icons.details_outlined,
                      label: "Details",
                      onTap: () => Navigator.pushNamed(
                        ctx,
                        ProductDetailScreen.routeName,
                        arguments: product.id,
                      ).then(
                        (value) => Navigator.canPop(context)
                            ? Navigator.pop(context)
                            : null,
                      ),
                    ),
                    Consumer<CartProvider>(
                      builder: (ctx, cart, ch) => DialogIcons(
                        icon: cart.cartList.containsKey(product.id)
                            ? Icons.shopping_cart
                            : Icons.shopping_cart_outlined,
                        label: "Add to Cart",
                        onTap: () {
                          cart.cartList.containsKey(product.id)

                              // ignore: unnecessary_statements
                              ? () {}
                              : cart.addItemToCart(
                                  product.id,
                                  product.price,
                                  product.imageUrl,
                                  product.title,
                                );
                          Navigator.canPop(context)
                              ? Navigator.pop(context)
                              : null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
