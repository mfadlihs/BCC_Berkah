import 'package:bcc/components/Navbar.dart';
import 'package:bcc/screen/Home.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: HomeScreen(),
        bucket: PageStorageBucket(),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
