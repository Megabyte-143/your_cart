import 'package:flutter/material.dart';

class LandingScreenGuestButton extends StatelessWidget {
  const LandingScreenGuestButton({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      autofocus: true,
      onPressed: null,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
          const Size(
            150,
            20,
          ),
        ),
        side: MaterialStateBorderSide.resolveWith(
          (states) =>  BorderSide(
            width: 5,
            color: Colors.blue.shade300,
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.white70,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: FittedBox(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
