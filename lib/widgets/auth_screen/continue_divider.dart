import 'package:flutter/material.dart';

class AuthScreenContinueDivider extends StatelessWidget {
  const AuthScreenContinueDivider({
    Key? key,
    required this.color, required this.fontSize,
  }) : super(key: key);
  final Color color;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            indent: 15,
            endIndent: 15,
            thickness: 2,
            color: Colors.black45,
          ),
        ),
        Container(
          child: Text(
            "Or Continue With",
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            indent: 15,
            endIndent: 15,
            thickness: 2,
            color: Colors.black45,
          ),
        ),
      ],
    );
  }
}
