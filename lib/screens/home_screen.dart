import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:your_cart/wigets/home_screen/popular_products.dart';
import 'package:your_cart/wigets/home_screen/popular_products_text.dart';

import '../wigets/home_screen/carousel.dart';
import '../wigets/home_screen/categories.dart';
import '../wigets/home_screen/categories_text.dart';
import '../wigets/home_screen/popular.dart';
import '../wigets/home_screen/popular_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      frontLayerBackgroundColor: Theme.of(context).backgroundColor,
      headerHeight: MediaQuery.of(context).size.height * 0.5,
      backLayer: const Center(
        child: Text('Back Screen'),
      ),
      appBar: BackdropAppBar(
        title: const Text(
          "Home",
        ),
        leading: const BackdropToggleButton(icon: AnimatedIcons.home_menu),
        actions: const [
          IconButton(
            onPressed: null,
            icon: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 25,
              child: CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(
                  'assets/images/user.png',
                ),
              ),
            ),
          )
        ],
        flexibleSpace: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration:  BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.yellow.shade500,
                Colors.white70,
              ],
              stops: const [0, 1],
            ),
          ),
        ),
      ),
      frontLayer: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeScreenCarousel(),
            const SizedBox(height: 20,),
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
