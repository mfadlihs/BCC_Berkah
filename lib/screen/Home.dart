import 'package:bcc/components/Navbar.dart';
import 'package:bcc/layout/home/HomeHeader.dart';
import 'package:bcc/layout/home/HomeHeading.dart';
import 'package:bcc/layout/home/HomeJumbotron.dart';
import 'package:bcc/layout/home/PopularProduct.dart';
import 'package:bcc/layout/home/PopularStore.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  remove() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
  }

  @override
  Widget build(BuildContext context) {
    remove();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeading,
              SizedBox(
                height: 16,
              ),
              HomeHeader,
              HomeJumbotron,
              PopularProduct(),
              PopularStore(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Navbar(
        index: 1,
      ),
    );
  }
}
