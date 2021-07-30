import 'package:flutter/material.dart';

import '../../constant/my_icons.dart';

import 'icons.dart';

class ProductDetailScreenAppBar extends StatelessWidget {
  const ProductDetailScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Detail"),
      centerTitle: true,
      bottomOpacity: 0.5,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductDetailScreenIcons(MyIcons.wishList, () {},Colors.amber,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductDetailScreenIcons(MyIcons.cart, () {},Colors.amber,),
        ),
      ],
    );
  }
}
