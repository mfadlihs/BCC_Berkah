import 'dart:async';

import 'package:bcc/components/Navbar.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuccessVerification extends StatelessWidget {
  const SuccessVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/');
    });

    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.primary,
        ),
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Your payment verified",
              style: AppText.header(),
            ),
            SizedBox(height: 8),
            Text(
              "your item will be processed soon",
              style: AppText.subtitle(),
            ),
            SizedBox(height: 32),
            Image.asset(
              "images/success_verification.png",
              width: 265,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
