import 'package:flutter/material.dart';

class LandingScreenSignButton extends StatelessWidget {
  const LandingScreenSignButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.icon,
  }) : super(key: key);
  final String title;
  final Function onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white70),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side:  BorderSide(
                color: Colors.yellow.shade600,
                width: 5,
              ),
            ),
          ),
        ),
        onPressed: () {
          onTap();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Icon(icon)
          ],
        ),
      ),
    );
  }
}
