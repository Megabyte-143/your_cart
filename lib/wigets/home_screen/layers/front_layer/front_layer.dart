import 'package:flutter/material.dart';

import 'carousel.dart';
import 'categories.dart';
import 'categories_text.dart';
import 'popular.dart';
import 'popular_products.dart';
import 'popular_products_text.dart';
import 'popular_text.dart';


class HomeScreenFrontLayer extends StatefulWidget {
  const HomeScreenFrontLayer({Key? key}) : super(key: key);

  @override
  _HomeScreenFrontLayerState createState() => _HomeScreenFrontLayerState();
}

class _HomeScreenFrontLayerState extends State<HomeScreenFrontLayer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeScreenCarousel(),
          const SizedBox(
            height: 20,
          ),
          const HomeScreenCategoriesText(),
          Container(
            // color: Colors.yellow,
            height: 300,
            width: double.infinity,
            child: ListView.builder(
              itemBuilder: (ctx, i) => HomeScreenCategories(i),
              itemCount: 7,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const HomeScreenPopularProductsText(),
          Container(
            height: 400,
            width: double.infinity,
            child: ListView.builder(
              itemBuilder: (ctx, i) => const HomeScreenPopularProducts(),
              itemCount: 7,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const HomeScreenPopularText(),
          const HomeScreenPopularSwiper(),
        ],
      ),
    );
  }
}
