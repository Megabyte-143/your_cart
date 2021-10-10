import 'package:flutter/material.dart';

class DialogIcons extends StatelessWidget {
  const DialogIcons({
    required this.label,
    required this.icon,
    required this.onTap,
  });
  final String label;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: Container(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 49,
                        //color: Colors.transparent,
                      ),
                    ],
                    color: Colors.transparent,
                  ),
                  child: ClipOval(
                    child: Icon(
                      icon,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                FittedBox(
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
