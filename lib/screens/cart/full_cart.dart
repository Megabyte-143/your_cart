import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/colors.dart';

import '../../provider/dark_theme_provider.dart';

import '../../wigets/full_cart/full_cart_icons.dart';
import '../../wigets/full_cart/full_cart_prices.dart';

class FullCartScreen extends StatefulWidget {
  const FullCartScreen({Key? key}) : super(key: key);

  @override
  _FullCartScreenState createState() => _FullCartScreenState();
}

class _FullCartScreenState extends State<FullCartScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).backgroundColor,
      ),
      // color: Colors.amber,
      height: 150,
      padding: const EdgeInsets.all(10),
      // width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Container(
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/03/26/09/47/sky-690293_960_720.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text(
                          'Title',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
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
                            print("yesss");
                          },
                          backIconColor: Colors.transparent,
                          icon: Icons.delete_forever,
                          iconColor: Colors.red,
                        ),
                      ),
                      // Material(
                      //   color: Colors.transparent,
                      //   child: InkWell(
                      //     borderRadius: BorderRadius.circular(32),
                      //     onTap: null,
                      //     child: Container(
                      //       height: 50,
                      //       width: 50,
                      //       child: const Icon(
                      //         Icons.delete_forever,
                      //         color: Colors.red,
                      //         size: 22,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  FullCartPrices(
                    'Price: ',
                    10000,
                    themeChange.darkTheme
                        ? Colors.yellow
                        : ColorsConsts.purple800,
                  ),
                  // Row(
                  //   children: [
                  //     Text('Price: '),
                  //     Text(
                  //       '10000',
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 15,
                  // color: themeChange.darkTheme
                  //     ? Colors.yellow
                  //     : ColorsConsts.purple800,
                  //       ),
                  //     )
                  //   ],
                  // ),
                  FullCartPrices(
                    'Subtotal: ',
                    10000,
                    themeChange.darkTheme
                        ? Colors.yellow
                        : ColorsConsts.purple800,
                  ),
                  //             ? Colors.yellow
                  //             : ColorsConsts.purple800,),
                  // Row(
                  //   children: [
                  //     Text('Subtotal: '),
                  //     Text(
                  //       '10000',
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 15,
                  // color: themeChange.darkTheme
                  //     ? Colors.yellow
                  //     : ColorsConsts.purple800,
                  //       ),
                  //     )
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Ships Free!!!'),
                      Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                FullCartIcons(
                                  onTap: () {
                                    print('yess');
                                  },
                                  backIconColor: Colors.red,
                                  icon: Icons.exposure_minus_1,
                                  iconColor: Colors.white,
                                ),
                                // Material(
                                //   color: Colors.red,
                                //   child: InkWell(
                                //     borderRadius: BorderRadius.circular(32),
                                //     onTap: null,
                                //     child: Container(
                                //       height: 22,
                                //       child: const Icon(
                                //         Icons.exposure_minus_1,
                                //         // color: Colors.red,
                                //         size: 22,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: themeChange.darkTheme
                                        ? ColorsConsts.backgroundColor
                                        : ColorsConsts.backgroundColor,
                                  ),
                                  height: 22,
                                  width: 22,
                                  child: Text(
                                    'q ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: themeChange.darkTheme
                                          ? ColorsConsts.title
                                          : ColorsConsts.title,
                                    ),
                                  ),
                                ),
                                FullCartIcons(
                                  onTap: () {
                                    print('yess');
                                  },
                                  backIconColor: Colors.green,
                                  icon: Icons.plus_one,
                                  iconColor: Colors.white,
                                ),
                                // Material(
                                //   color: Colors.green,
                                //   child: InkWell(
                                //     borderRadius: BorderRadius.circular(32),
                                //     onTap: null,
                                //     child: Container(
                                //       child: const Icon(
                                //         Icons.plus_one,
                                //         // color: Colors.red,
                                //         size: 22,
                                //       ),
                                //     ),
                                //   ),
                                // ),
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
    );
  }
}
