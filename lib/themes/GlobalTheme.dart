import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/material.dart';

var appTheme = ThemeData(
  fontFamily: 'SF UI Display',
  primarySwatch: themeColor,
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(
      AppColor.gray,
    ),
  ),
);
