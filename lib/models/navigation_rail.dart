import 'package:flutter/material.dart';

NavigationRailDestination destination(String brandName) {
  return NavigationRailDestination(
    icon: Icon(Icons.ac_unit),
    label: Text(brandName),
  );
}
