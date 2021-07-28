import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:your_cart/screens/inner_screen.dart';

class HomeScreenPopularSwiper extends StatelessWidget {
  const HomeScreenPopularSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _swiperImges = [
      'assets/images/addidas.jpg',
      'assets/images/apple.jpg',
      'assets/images/Dell.jpg',
      'assets/images/h&m.jpg',
      'assets/images/Huawei.jpg',
      'assets/images/nike.jpg',
      'assets/images/samsung.jpg',
    ];

    return Container(
      margin: const EdgeInsets.all(10),
      height: 290,
      width: MediaQuery.of(context).size.width * 0.95,
      child: Swiper(
          onTap: (index) {
            Navigator.of(context).pushNamed(InnerScreen.routeName, arguments: {
              index,
            });
          },
          layout: SwiperLayout.TINDER,
          autoplay: true,
          itemCount: _swiperImges.length,
          itemWidth: MediaQuery.of(context).size.width * 0.95,
          itemHeight: 290,
          itemBuilder: (ctx, i) {
            return Container(
              padding: const EdgeInsets.all(3),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  _swiperImges[i],
                  fit: BoxFit.fill,
                ),
              ),
            );
          }),
    );
  }
}
