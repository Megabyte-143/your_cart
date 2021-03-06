import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';

import '../../screens/product_detail_screen.dart';

import '../../widgets/feeds_screen/dialog.dart';

class Feeds extends StatelessWidget {
  const Feeds({
    Key? key,
    required this.darkTheme,
    required this.product,
  }) : super(key: key);

  final bool darkTheme;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        ProductDetailScreen.routeName,
        arguments: product.id,
      ),
      child: Container(
        margin: const EdgeInsets.only(
          top: 20,
          left: 10,
          right: 10,
        ),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: darkTheme ? Colors.grey.shade800 : Colors.yellow.shade200,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        minHeight: 80,
                        maxHeight: MediaQuery.of(context).size.height * 0.34,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(product.imageUrl),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Badge(
                      badgeContent: const Text(
                        'New',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(8),
                      ),
                      toAnimate: true,
                      shape: BadgeShape.square,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      // height: 100,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        //color: Colors.black12,
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Text(
                              product.description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: darkTheme ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              bottom: 3,
                              top: 2,
                            ),
                            child: Text(
                              '\$ ${product.price}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color:
                                    darkTheme ? Colors.yellow : Colors.purple,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${product.quantity}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (builder) => FeedsScreenDialog(
                                        product: product,
                                        ctx: context,
                                      ),
                                    );
                                    print('Feeds Items More Button');
                                  },
                                  child: const Icon(
                                    Icons.more_horiz,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
