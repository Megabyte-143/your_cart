import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/colors.dart';

import '../../models/cart.dart';

import '../../provider/cart_provider.dart';
import '../../provider/dark_theme_provider.dart';

import '../../screens/product_detail_screen.dart';

import '../alert_dialog.dart';
import 'full_cart_icons.dart';
import 'full_cart_prices.dart';

class FullCartItems extends StatefulWidget {
  // const FullCartItems({
  //   Key? key,
  //   required this.imageUrl,
  //   required this.price,
  //   required this.quantity,
  //   required this.title,
  // }) : super(key: key);
  // final String imageUrl;
  // final double price;
  // final int quantity;
  // final String title;
  const FullCartItems({required this.productId});
  final String productId;

  @override
  _FullCartItemsState createState() => _FullCartItemsState();
}

class _FullCartItemsState extends State<FullCartItems> {
  @override
  Widget build(BuildContext context) {
    final AlertDialogMethod alertDialog = AlertDialogMethod();
    final _cart = Provider.of<Cart>(context);
    final String imageUrl = _cart.imageUrl;
    final double price = _cart.price;
    final int quantity = _cart.quantity;
    final String title = _cart.title;
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final _cartList = Provider.of<CartProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
            arguments: widget.productId);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: themeChange.darkTheme ? Colors.grey.shade800 : Colors.black38,
        ),
        height: 150,
        margin: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          child: FullCartIcons(
                            onTap: () {
                              alertDialog.showDialogMethod(
                                'Delete The Item',
                                'Are you Sure?',
                                () => _cartList.deleteItem(widget.productId),
                                context,
                              );
                            },
                            backIconColor: Colors.transparent,
                            icon: Icons.delete_forever,
                            iconColor: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FullCartPrices(
                      'Price: ',
                      price,
                      themeChange.darkTheme
                          ? Colors.yellow
                          : ColorsConsts.purple800,
                    ),
                    FullCartPrices(
                      'Subtotal: ',
                      price * quantity,
                      themeChange.darkTheme
                          ? Colors.yellow
                          : ColorsConsts.purple800,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Ships Free!!!'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: Row(
                                children: [
                                  FullCartIcons(
                                    onTap: _cart.quantity < 2
                                        ? () {}
                                        : () {
                                            _cartList.removeItemFromCart(
                                              widget.productId,
                                              price,
                                              imageUrl,
                                              title,
                                            );
                                          },
                                    backIconColor: _cart.quantity < 2
                                        ? Colors.grey
                                        : Colors.red,
                                    icon: Icons.exposure_minus_1,
                                    iconColor: Colors.white,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          ColorsConsts.gradiendFStart,
                                          ColorsConsts.gradiendFEnd
                                        ],
                                        stops: const [0, 0.7],
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: 21.98,
                                    width: 22,
                                    child: Text(
                                      '$quantity',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: themeChange.darkTheme
                                            ? ColorsConsts.title
                                            : Colors.yellow.shade500,
                                      ),
                                    ),
                                  ),
                                  FullCartIcons(
                                    onTap: () {
                                      _cartList.addItemToCart(
                                        widget.productId,
                                        price,
                                        imageUrl,
                                        title,
                                      );
                                    },
                                    backIconColor: Colors.green,
                                    icon: Icons.plus_one,
                                    iconColor: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
