import 'dart:convert';

import 'package:bcc/api/action.dart';
import 'package:bcc/api/baseUrl.dart';
import 'package:bcc/api/token.dart';
import 'package:bcc/class/User.dart';
import 'package:bcc/components/Navbar.dart';
import 'package:bcc/layout/profile/ProfileBiodata.dart';
import 'package:bcc/layout/profile/ProfileHeader.dart';
import 'package:bcc/layout/profile/ProfileStore.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    getUser();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: getUser(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  width: double.infinity,
                  height: 400,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                var data = snapshot.data as User;
                return Column(
                  children: [
                    ProfileHeader(data),
                    divider,
                    ProfileBiodata(data),
                    divider,
                    ProfileStore(data),
                    divider,
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(onPrimary: Colors.red),
                          onPressed: () async {
                            await removeToken();
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              "/login",
                              (route) => false,
                            );
                          },
                          child: Text(
                            'LOG OUT',
                            style: AppText.subtitle(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                );
              }
            }),
          ),
        ),
      ),
      bottomNavigationBar: Navbar(index: 4),
    );
  }
}
