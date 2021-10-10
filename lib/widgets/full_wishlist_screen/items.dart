import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/wishlist.dart';

import '../../provider/dark_theme_provider.dart';
import '../../provider/wishlist_provider.dart';

import '../../screens/product_detail_screen.dart';

import '../alert_dialog.dart';

import 'icons.dart';
import 'image.dart';
import 'text.dart';

class FullWishlistScreenItems extends StatelessWidget {
  const FullWishlistScreenItems({Key? key, required this.productId})
      : super(key: key);
  final String productId;
  @override
  Widget build(BuildContext context) {
    final wishlist = Provider.of<Wishlist>(context);
    final AlertDialogMethod alertDialog = AlertDialogMethod();
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: productId,
            );
          },
          splashColor: Colors.black,
          child: Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:
                  themeChange.darkTheme ? Colors.grey.shade300 : Colors.black38,
            ),
            margin: const EdgeInsets.only(
              left: 10,
              right: 30,
              bottom: 0,
              top: 10,
            ),
            padding: const EdgeInsets.all(15),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 3,
              child: Row(
                children: [
                  FullWishlistScreenImage(
                    imageUrl: wishlist.imageUrl,
                  ),
                  FullWishlistScreenText(
                    price: wishlist.price,
                    title: wishlist.title,
                  ),
                ],
              ),
            ),
          ),
        ),
        FullWishlistScreenIcon(
          onTap: () {
            alertDialog.showDialogMethod(
              'Remove it from Wishlist',
              'Are you Sure?',
              () => Provider.of<WishlistProvider>(context, listen: false)
                  .deleteItem(productId),
              context,
            );
          },
        ),
      ],
    );
  }
}
