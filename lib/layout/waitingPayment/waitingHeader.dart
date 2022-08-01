import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaitingHeader extends StatefulWidget {
  WaitingHeader({Key? key}) : super(key: key);

  @override
  State<WaitingHeader> createState() => _WaitingHeaderState();
}

class _WaitingHeaderState extends State<WaitingHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: CircleBorder(),
            padding: EdgeInsets.all(8),
          ),
          child: Icon(
            Icons.navigate_before,
          ),
        ),
        SizedBox(width: 8),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColor.primary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Icon(
                Icons.credit_card_outlined,
                color: AppColor.textSecondary,
                size: 16,
              ),
              SizedBox(width: 10),
              Text(
                "Waiting For Payment",
                style: AppText.body(color: AppColor.textSecondary),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ],
    );
  }
}
