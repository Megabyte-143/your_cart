import 'package:flutter/material.dart';

import '../wigets/feeds_screen/feeds_screen_items.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FeedsScreenItems(),
      ),
    );
  }
}
