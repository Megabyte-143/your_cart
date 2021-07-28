import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreenCarousel extends StatefulWidget {
  const HomeScreenCarousel({Key? key}) : super(key: key);

  @override
  _HomeScreenCarouselState createState() => _HomeScreenCarouselState();
}

class _HomeScreenCarouselState extends State<HomeScreenCarousel> {
  final List<String> _carouselImages = [
    'assets/images/carousel1.png',
    'assets/images/carousel2.jpeg',
    'assets/images/carousel3.jpg',
    'assets/images/carousel4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      height: 250,
      // decoration: const BoxDecoration(color: Colors.black),
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          disableCenter: true,
          enlargeCenterPage: true,
        ),
        items: _carouselImages
            .map((i) => Container(
                  child: Center(
                    child: Image.asset(
                      i,
                      fit: BoxFit.fill,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
