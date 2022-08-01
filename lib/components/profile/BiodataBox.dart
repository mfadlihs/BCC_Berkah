import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BiodataBox extends StatelessWidget {
  final String text;

  BiodataBox({Key? key, required String this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8, bottom: 12),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
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
              color: AppColor.primary,
              width: 1,
            ),
          ),
          hintText: "$text",
          hintStyle: AppText.subtitle(),
        ),
        readOnly: true,
      ),
    );
  }
}


/*


TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(
                  color: AppColor.primary,
                ),
              ),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 24,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(
                  color: AppColor.primary,
                  width: 1,
                ),
              ),
              hintText: "wkwkwk",
              hintStyle: AppText.subtitle(),
            ),
            readOnly: true,
          ),
*/