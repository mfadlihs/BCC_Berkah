// ignore_for_file: non_constant_identifier_names

import 'package:bcc/themes/AppColors.dart';
import 'package:flutter/cupertino.dart';

class AppText {
  // static TextStyle h1 = const TextStyle(
  //   fontWeight: FontWeight.w700,
  //   fontSize: 24,
  // );

  static TextStyle header({
    double? fontSize = 24,
    FontWeight? fontWeight = FontWeight.w700,
    Color color = const Color(0xFF263238),
    double? lineHeight,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: lineHeight,
    );
  }

  static TextStyle subheader({
    double? fontSize = 16,
    FontWeight? fontWeight = FontWeight.w700,
    Color color = const Color(0xFF263238),
    double? lineHeight,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: lineHeight,
    );
  }

  static TextStyle title({
    double? fontSize = 16,
    FontWeight? fontWeight = FontWeight.w500,
    Color color = const Color(0xFF263238),
    double? lineHeight,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: lineHeight,
    );
  }

  static TextStyle subtitle({
    double? fontSize = 14,
    FontWeight? fontWeight = FontWeight.w500,
    Color color = const Color(0xFF263238),
    double? lineHeight,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: lineHeight,
      color: color,
    );
  }

  static TextStyle body({
    double? fontSize = 12,
    FontWeight? fontWeight = FontWeight.w500,
    Color color = const Color(0xFF263238),
    double? lineHeight,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: lineHeight,
    );
  }

  static TextStyle desc({
    double? fontSize = 10,
    FontWeight? fontWeight = FontWeight.w500,
    Color color = const Color(0xFF9E9E9E),
    double? lineHeight,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: lineHeight,
    );
  }
}

class Header {
  /*
    font-family: 'SF UI Display';
    font-style: normal;
    font-weight: 700;
    font-size: 24px;
    line-height: 29px;
  */

  @override
  double? fontSize = 24;

  @override
  FontWeight? fontWeight = FontWeight.w700;

  @override
  Color? color = AppColor.textPrimary;

  Header({this.fontSize, this.fontWeight, this.color});
}

class Subheader extends TextStyle {
  /*
    font-family: 'SF UI Display';
    font-style: normal;
    font-weight: 700;
    font-size: 16px;
    line-height: 19px;
  */

  @override
  double? fontSize = 16;

  @override
  FontWeight? fontWeight = FontWeight.w700;

  @override
  Color? color = AppColor.textPrimary;

  Subheader({this.fontSize, this.fontWeight, this.color});
}

class Title extends TextStyle {
  /*
    font-family: 'SF UI Display';
    font-style: normal;
    font-weight: 500;
    font-size: 16px;
    line-height: 19px;
  */

  @override
  double? fontSize = 16;

  @override
  FontWeight? fontWeight = FontWeight.w500;

  @override
  Color? color = AppColor.textPrimary;

  Title({this.fontSize, this.fontWeight, this.color});
}

class Subtitle extends TextStyle {
  /*
    font-family: 'SF UI Display';
    font-style: normal;
    font-weight: 500;
    font-size: 14px;
    line-height: 17px;
  */

  @override
  double? fontSize = 14;

  @override
  FontWeight? fontWeight = FontWeight.w500;

  @override
  Color? color = AppColor.textPrimary;

  Subtitle({this.fontSize, this.fontWeight, this.color});
}

class Body extends TextStyle {
  /*
    font-family: 'SF UI Display';
    font-style: normal;
    font-weight: 500;
    font-size: 12px;
    line-height: 14px;
  */

  @override
  double? fontSize = 12;

  @override
  FontWeight? fontWeight = FontWeight.w500;

  @override
  Color? color = AppColor.textPrimary;

  Body({this.fontSize, this.fontWeight, this.color});
}

class Desc extends TextStyle {
  /*
    font-family: 'SF UI Display';
    font-style: normal;
    font-weight: 500;
    font-size: 10px;
    line-height: 12px;
  */

  @override
  double? fontSize = 10;

  @override
  FontWeight? fontWeight = FontWeight.w500;

  @override
  Color? color = AppColor.textPrimary;

  Desc({this.fontSize, this.fontWeight, this.color});
}
