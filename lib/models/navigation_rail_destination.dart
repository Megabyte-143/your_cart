import 'package:flutter/material.dart';

NavigationRailDestination destination(String brandName) {
  return NavigationRailDestination(
    icon: const SizedBox.shrink(),
    label: RotatedBox(
      quarterTurns: -1,
      child: Text(
        brandName,
        style: const TextStyle(
          decorationStyle: TextDecorationStyle.solid,
          decoration: TextDecoration.underline,
          decorationThickness: 2,
        ),
      ),
    ),
  );
}
