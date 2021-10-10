import 'package:flutter/material.dart';

import '../../../../../screens/inner_screen/popular_inner_screen.dart';

class HomeScreenPopularText extends StatelessWidget {
  const HomeScreenPopularText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Popular Brands",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                PopularBrandInnerScreen.routeName,
                arguments: {7},
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
