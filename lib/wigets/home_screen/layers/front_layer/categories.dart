import 'package:flutter/material.dart';

import 'categories_labels.dart';

class HomeScreenCategories extends StatelessWidget {
  //const HomeScreenCategories({Key? key}) : super(key: key);

  const HomeScreenCategories(this.index);
  final int index;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> _categories = [
      {
        'category': 'Phones',
        'categoryImagePath': 'assets/images/CatPhones.png'
      },
      {
        'category': 'Beauty',
        'categoryImagePath': 'assets/images/CatBeauty.jpg'
      },
      {
        'category': 'Clothes',
        'categoryImagePath': 'assets/images/CatClothes.jpg'
      },
      {
        'category': 'Furniture',
        'categoryImagePath': 'assets/images/CatFurniture.jpg'
      },
      {
        'category': 'Laptops',
        'categoryImagePath': 'assets/images/CatLaptops.png'
      },
      {'category': 'Shoes', 'categoryImagePath': 'assets/images/CatShoes.jpg'},
      {
        'category': 'Watches',
        'categoryImagePath': 'assets/images/CatWatches.jpg'
      },
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              height: 250,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(
                    _categories[index]['categoryImagePath'].toString(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 0),
            ),
            HomeScreenCategoriesLabels(categories: _categories, index: index)
          ],
        ),
      ],
    );
  }
}
