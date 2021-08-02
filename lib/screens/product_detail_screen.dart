import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/my_icons.dart';

import '../models/product.dart';

import '../provider/product_list_provider.dart';

import '../wigets/product_detail_screen.dart/bottom_bar.dart';
import '../wigets/product_detail_screen.dart/double_icons.dart';
import '../wigets/product_detail_screen.dart/icons.dart';
import '../wigets/product_detail_screen.dart/image.dart';
import '../wigets/product_detail_screen.dart/points_description.dart';
import '../wigets/product_detail_screen.dart/review.dart';
import '../wigets/product_detail_screen.dart/suggestion.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/product-detail-screen';
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments.toString();
    final _product = Provider.of<ProductListProvider>(context);
    final Product product = _product.findById(productId.toString());

    return Scaffold(
      body: Stack(
        children: [
          ProductDetailScreenImage(
            imageUrl: product.imageUrl,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 360,
                ),
                const ProductDetailScreenDoubleIcons(),
                Container(
                  color: Colors.black38,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "US \$ ${product.price}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 4,
                        height: 30,
                        color: Colors.white,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                        ),
                        child: Text(
                          product.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 4,
                        height: 30,
                        color: Colors.white,
                      ),
                      ProductDetailScreenPoints(
                        brandName: product.brand,
                        catName: product.productCategoryName,
                        popularity: product.isPopular.toString(),
                        quantity: product.quantity,
                      ),
                      const Divider(
                        thickness: 4,
                        height: 30,
                        color: Colors.white,
                      ),
                      const ProductDetailScreenReview(),
                      const Divider(
                        thickness: 4,
                        height: 30,
                        color: Colors.white,
                      ),
                      ProductDetailScreenSuggestions(
                        catName: product.productCategoryName,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ProductDetailSccreenBottomBar(
            id: productId,
            title: product.title,
            imageUrl: product.imageUrl,
            price: product.price,
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text("Detail"),
        centerTitle: true,
        bottomOpacity: 0.5,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProductDetailScreenIcons(
              MyIcons.wishList,
              () {},
              Colors.amber,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProductDetailScreenIcons(
              MyIcons.cart,
              () {},
              Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
