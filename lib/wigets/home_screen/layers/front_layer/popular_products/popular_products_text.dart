import 'package:flutter/material.dart';

import '../../../../../screens/feeds screen/feeds_screen.dart';


class HomeScreenPopularProductsText extends StatelessWidget {
  const HomeScreenPopularProductsText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Popular Products",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                FeedsScreen.routeName,arguments: 'popular',
              );
            },
            child: const Text(
              'View All',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
