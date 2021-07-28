import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';

import 'back_layer_screen.dart';
import 'front_layer_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      frontLayerBackgroundColor: Theme.of(context).backgroundColor,
      headerHeight: MediaQuery.of(context).size.height * 0.45,
      backLayer: const HomeScreenBackLayer(),
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
          decoration: BoxDecoration(
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
      frontLayer: const HomeScreenFrontLayer(),
    );
  }
}
