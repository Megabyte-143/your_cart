import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';

import '../../wigets/home_screen/home_screen_carousel.dart';
import '../../wigets/home_screen/home_screen_popular.dart';
import '../../wigets/home_screen/home_screen_swiper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      frontLayerBackgroundColor: Theme.of(context).backgroundColor,
      headerHeight: MediaQuery.of(context).size.height * 0.5,
      backLayer: Center(
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
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.yellow,
                Colors.white70,
              ],
              stops: [0, 1],
            ),
          ),
        ),
      ),
      frontLayer: Column(
        children:  const [
          HomeScreenCarousel(),
          HomeScreenPopular(),
          HomeScreenSwiper(),
        ],
      ),
    );
  }
}
