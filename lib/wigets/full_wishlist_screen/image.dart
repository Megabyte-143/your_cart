import 'package:flutter/material.dart';

class FullWishlistScreenImage extends StatelessWidget {
  const FullWishlistScreenImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1300&q=80',
          ),
          fit: BoxFit.cover,
          
        ),
        boxShadow: [BoxShadow(offset: Offset.fromDirection(2,1))]
      ),
    );
  }
}
