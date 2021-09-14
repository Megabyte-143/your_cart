
import 'package:flutter/material.dart';

import 'bottom_bar_screen.dart';
import 'upload_product_sceen.dart';

class MainScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [const BottomBarScreen(), UploadProductScreen()],
    );
  }
}
