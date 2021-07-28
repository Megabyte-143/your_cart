import 'package:flutter/material.dart';

NavigationRailDestination destination(String brandName) {
  return NavigationRailDestination(
    icon: SizedBox.shrink(),
    label: RotatedBox(
      quarterTurns: -1,
      child: Text(
        brandName,
        style: TextStyle(
          decorationStyle: TextDecorationStyle.solid,
          decoration: TextDecoration.underline,
          decorationThickness: 2,
        ),
      ),
    ),
  );
}
