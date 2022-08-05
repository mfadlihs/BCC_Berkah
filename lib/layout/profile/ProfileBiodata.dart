import 'dart:developer';

import 'package:bcc/class/User.dart';
import 'package:bcc/components/profile/BiodataBox.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileBiodata extends StatefulWidget {
  User data;
  ProfileBiodata(this.data, {Key? key}) : super(key: key);

  @override
  State<ProfileBiodata> createState() => _ProfileBiodataState();
}

class _ProfileBiodataState extends State<ProfileBiodata> {
  @override
  Widget build(BuildContext context) {
    User data = widget.data;

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Biodata",
                style: AppText.subheader(),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/edit-profile",
                      arguments: data);
                },
                child: FaIcon(
                  FontAwesomeIcons.edit,
                  color: AppColor.secondary2,
                  size: 18,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            "Name",
            style: AppText.subtitle(),
          ),
          BiodataBox(text: "${data.nama}"),
          Text(
            "Date of Birth",
            style: AppText.subtitle(),
          ),
          BiodataBox(text: "${data.tanggal_lahir}"),
          Text(
            "Address",
            style: AppText.subtitle(),
          ),
          BiodataBox(text: "${data.alamat}"),
          Text(
            "Gender",
            style: AppText.subtitle(),
          ),
          BiodataBox(text: "${data.gender}"),
        ],
      ),
    );
  }
}
