import 'package:flutter/material.dart';

import '../../wigets/home_screen/layers/front_layer/carousel.dart';
import '../../wigets/home_screen/layers/front_layer/categories.dart';
import '../../wigets/home_screen/layers/front_layer/categories_text.dart';
import '../../wigets/home_screen/layers/front_layer/popular.dart';
import '../../wigets/home_screen/layers/front_layer/popular_products.dart';
import '../../wigets/home_screen/layers/front_layer/popular_products_text.dart';
import '../../wigets/home_screen/layers/front_layer/popular_text.dart';


class HomeScreenFrontLayer extends StatefulWidget {
  const HomeScreenFrontLayer({Key? key}) : super(key: key);

  @override
  _HomeScreenFrontLayerState createState() => _HomeScreenFrontLayerState();
}

class _HomeScreenFrontLayerState extends State<HomeScreenFrontLayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeScreenCarousel(),
            // const SizedBox(
            //   height: 20,
            // ),
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
      ),
    );
  }
}
