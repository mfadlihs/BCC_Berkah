import 'package:bcc/layout/method/MethodAtm.dart';
import 'package:bcc/layout/method/MethodEWallet.dart';
import 'package:bcc/layout/method/MethodHeader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MethodScreen extends StatelessWidget {
  const MethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                MethodHeader(),
                SizedBox(height: 16),
                MethodAtm(),
                SizedBox(height: 16),
                MethodEWallet(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
