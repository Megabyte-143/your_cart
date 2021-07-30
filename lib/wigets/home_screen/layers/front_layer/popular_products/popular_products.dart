import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../models/product.dart';

import '../../../../../provider/dark_theme_provider.dart';

import '../../../../../screens/product_detail_screen.dart';

class HomeScreenPopularProducts extends StatelessWidget {
  const HomeScreenPopularProducts(this.product);
  final Product product;
  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;

    return InkWell(
      onTap: () =>
          Navigator.of(context).pushNamed(ProductDetailScreen.routeName),
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
                      borderRadius: BorderRadius.only(
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
                  const Positioned(
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.star_outline_outlined),
                      onPressed: null,
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
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        child: Text(
                          product.description,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            return print("POPULAR ADD TO CART");
                          },
                          child: const Icon(
                            Icons.add_shopping_cart_outlined,
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
