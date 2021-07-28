import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';

import '../wigets/home_screen/layers/back_layer.dart';
import '../wigets/home_screen/layers/front_layer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      frontLayerBackgroundColor: Theme.of(context).backgroundColor,
      headerHeight: MediaQuery.of(context).size.height * 0.5,
      backLayer: HomeScreenBackLayer(),
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
