import 'package:flutter/material.dart';

import 'icons.dart';
import 'image.dart';
import 'text.dart';

class FullWishlistScreenItems extends StatelessWidget {
  const FullWishlistScreenItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {},
          splashColor: Colors.black,
          child: Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //color: Colors.yellow,
            ),
            margin: EdgeInsets.only(
              left: 10,
              right: 30,
              bottom: 0,
            ),
            padding: EdgeInsets.all(10),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 3,
              child: Row(
                children: [
                  FullWishlistScreenImage(),
                  FullWishlistScreenText(),
                ],
              ),
            ),
          ),
        ),
        FullWishlistScreenIcon(),
      ],
    );
  }
}
