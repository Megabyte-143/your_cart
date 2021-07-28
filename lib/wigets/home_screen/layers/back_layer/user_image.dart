import 'package:flutter/material.dart';

class BackLayerUserImage extends StatelessWidget {
  const BackLayerUserImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 150,
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.yellow.shade50,
      ),
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/user.png',
            ),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
