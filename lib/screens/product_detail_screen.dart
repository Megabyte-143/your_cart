import 'package:flutter/material.dart';

import '../wigets/product_detail_screen.dart/app_bar.dart';
import '../wigets/product_detail_screen.dart/bottom_bar.dart';
import '../wigets/product_detail_screen.dart/double_icons.dart';
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
    return Scaffold(
      body: Stack(
        children: [
          const ProductDetailScreenImage(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 360,
                ),
                ProductDetailScreenDoubleIcons(),
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
                          children: const [
                            Text(
                              "Title",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Price",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                        ),
                        child: const Text(
                          "Description",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      ProductDetailScreenPoints(),
                      const Divider(
                        thickness: 2,
                      ),
                      const ProductDetailScreenReview(),
                      const Divider(
                        thickness: 2,
                      ),
                      const ProductDetailScreenSuggestions(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const ProductDetailScreenAppBar(),
          ProductDetailSccreenBottomBar(),
        ],
      ),
    );
  }
}
