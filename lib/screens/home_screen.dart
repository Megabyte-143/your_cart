import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';

import '../../wigets/home_screen/home_screen_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      headerHeight: MediaQuery.of(context).size.height * 0.5,
      backLayer: Center(
        child: Text('Back Screen'),
      ),
      frontLayer: HomeScreenCarousel(),
      appBar: BackdropAppBar(
        title: Text(
          "Home",
        ),
        leading: BackdropToggleButton(icon: AnimatedIcons.home_menu),
        actions: [
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
          decoration: BoxDecoration(
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
    );
  }
}
