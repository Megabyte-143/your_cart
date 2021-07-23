import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/colors.dart';

import '../../provider/dark_theme_provider.dart';

import 'full_cart_icons.dart';
import 'full_cart_prices.dart';

class FullCartItems extends StatefulWidget {
  const FullCartItems({Key? key}) : super(key: key);

  @override
  _FullCartItemsState createState() => _FullCartItemsState();
}

class _FullCartItemsState extends State<FullCartItems> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: themeChange.darkTheme ? Colors.grey.shade800 : Colors.black38,
      ),
      // color: Colors.amber,
      height: 150,
      //padding: const EdgeInsets.all(10),
      // width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Container(
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/03/26/09/47/sky-690293_960_720.jpg'),
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
                  const SizedBox(
                    height: 20,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
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
                                    gradient: LinearGradient(
                                      colors: [
                                        ColorsConsts.gradiendFStart,
                                        ColorsConsts.gradiendFEnd
                                      ],
                                      stops: const [0, 0.7],
                                    ),
                                  ),
                                  height: 21.98,
                                  width: 22,
                                  child: Text(
                                    '5',
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
