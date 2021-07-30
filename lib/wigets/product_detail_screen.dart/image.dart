import 'package:flutter/material.dart';

class ProductDetailScreenImage extends StatelessWidget {
  const ProductDetailScreenImage({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.42,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        image:  DecorationImage(
          image: NetworkImage(
            imageUrl,
          ),
          fit: BoxFit.contain,
        ),
      ),
      foregroundDecoration: const BoxDecoration(
        color: Colors.black12,
      ),
    );
  }
}
