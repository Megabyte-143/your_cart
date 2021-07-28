import 'package:flutter/material.dart';

class ProductDetailScreenImage extends StatelessWidget {
  const ProductDetailScreenImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      decoration:  BoxDecoration(
        color: Colors.grey.shade400,
        image: DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1300&q=80',
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
