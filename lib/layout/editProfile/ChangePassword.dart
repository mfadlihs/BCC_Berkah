import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Change Password",
            style: AppText.subheader(),
          ),
          SizedBox(height: 16),

          // password
          Text(
            "Password",
            style: AppText.subtitle(),
          ),
          SizedBox(height: 8),
          TextField(
            readOnly: true,
            decoration: styleInput("*********"),
          ),
          SizedBox(height: 16),

          // New Password
          Text(
            "New Password",
            style: AppText.subtitle(),
          ),
          SizedBox(height: 8),
          TextField(
            readOnly: true,
            decoration: styleInput("*********"),
          ),
          SizedBox(height: 16),

          // New Password, again
          Text(
            "New Password, again",
            style: AppText.subtitle(),
          ),
          SizedBox(height: 8),
          TextField(
            readOnly: true,
            decoration: styleInput("*********"),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  styleInput(String hintText) {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(
          width: 1,
          color: AppColor.primary,
        ),
      ),
      isDense: true,
      contentPadding: EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(
          color: AppColor.gray,
          width: 1,
        ),
      ),
      hintStyle: AppText.subtitle(
        color: AppColor.textSecondary,
      ),
      hintText: hintText,
    );
  }
}
