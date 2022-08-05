import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentHeader extends StatefulWidget {
  PaymentHeader({Key? key}) : super(key: key);

  @override
  State<PaymentHeader> createState() => _PaymentHeaderState();
}

class _PaymentHeaderState extends State<PaymentHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
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
              Text("Payment", style: AppText.subheader()),
            ],
          ),
          SizedBox(height: 16),
          Text(
            "Delivery address",
            style: AppText.subheader(color: AppColor.textSecondary),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Text(
                "Malang, Jawa Timur",
                style: AppText.subtitle(),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.keyboard_arrow_down,
                size: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
