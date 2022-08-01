import 'dart:async';

import 'package:bcc/components/Navbar.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaitingVerificationScreen extends StatelessWidget {
  const WaitingVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 10), () {
      Navigator.pushNamed(context, '/success-verification');
    });

    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.primary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Please wait",
              style: AppText.header(),
            ),
            SizedBox(height: 8),
            Text(
              "we are checking your payment",
              style: AppText.subtitle(),
            ),
            SizedBox(height: 32),
            Image.asset(
              "images/waiting_verification.png",
              width: 265,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
