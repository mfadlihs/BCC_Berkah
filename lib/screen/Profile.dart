import 'package:bcc/components/Navbar.dart';
import 'package:bcc/layout/profile/ProfileBiodata.dart';
import 'package:bcc/layout/profile/ProfileHeader.dart';
import 'package:bcc/layout/profile/ProfileStore.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var divider = Container(
    width: double.infinity,
    height: 1,
    color: AppColor.secondary1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileHeader(),
              divider,
              ProfileBiodata(),
              // divider,
              // ProfileStore(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Navbar(index: 4),
    );
  }
}
