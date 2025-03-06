import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData darktheme =
      ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.purple);
  static ThemeData lighttheme =
      ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.red);
}
