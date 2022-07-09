import 'package:bcc/screen/DetailProduct.dart';
import 'package:bcc/screen/Home.dart';
import 'package:bcc/screen/Navigation.dart';
import 'package:bcc/screen/Landing.dart';
import 'package:bcc/screen/SignIn.dart';
import 'package:bcc/screen/Splash.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/GlobalTheme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      // theme: appTheme,
      home: Navigation(),
    );
  }
}
