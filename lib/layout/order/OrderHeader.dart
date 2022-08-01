import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderHeader extends StatefulWidget {
  OrderHeader({Key? key}) : super(key: key);

  @override
  State<OrderHeader> createState() => _OrderHeaderState();
}

class _OrderHeaderState extends State<OrderHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.account_balance_wallet_outlined,
                color: AppColor.gray,
                size: 16,
              ),
              SizedBox(width: 8),
              Text(
                "Waiting For Payment",
                style: AppText.body(color: AppColor.textSecondary),
              ),
            ],
          ),
          Icon(
            Icons.navigate_next,
            size: 16,
            color: AppColor.gray,
          ),
        ],
      ),
    );
  }
}
