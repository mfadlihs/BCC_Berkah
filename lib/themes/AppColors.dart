// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppColor {
  // primary
  static Color primary = Color(0xFF8BD0CF);

  // secondary
  static Color secondary1 = Color(0xFFE9DAC1);
  static Color secondary2 = Color(0xFF18978F);

  // tertiary
  static Color tertiary = Color(0xFFF4EFF8);

  // text
  static Color textPrimary = Color(0xFF263238);
  static Color textSecondary = Color(0xFF9E9E9E);
  static Color white = Color(0xFFFFFFFF);
  static Color gray = Color(0xFF939393);
}

MaterialColor themeColor = const MaterialColor(0xFF8BD0CF, {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
});
