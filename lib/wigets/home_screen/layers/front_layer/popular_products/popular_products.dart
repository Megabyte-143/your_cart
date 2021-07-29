import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/dark_theme_provider.dart';

class HomeScreenPopularProducts extends StatelessWidget {
  const HomeScreenPopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Container(
      padding: const EdgeInsets.all(10),
      width: 250,
      height: 400,
      child: Column(
        children: [
          Container(
            height: 200,
            child: Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: 200,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1300&q=80',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const Positioned(
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.star_outline_outlined),
                    onPressed: null,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: const Text(
                      '\$ 123',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkTheme ? Colors.yellow : Colors.purple,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          return print("POPULAR ADD TO CART");
                        },
                        child: const Icon(
                          Icons.add_shopping_cart_outlined,
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
    );
  }
}
