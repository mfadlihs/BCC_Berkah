import 'package:bcc/Function/Uang.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentNav extends StatefulWidget {
  int harga;
  int amount;

  PaymentNav(this.harga, this.amount, {Key? key}) : super(key: key);

  @override
  State<PaymentNav> createState() => _PaymentNavState();
}

class _PaymentNavState extends State<PaymentNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(
        // vertical: 19,
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        color: AppColor.secondary1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${uang(widget.harga)}",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 2),
              Text(
                "${widget.amount} item",
                style: AppText.subtitle(
                  color: AppColor.textSecondary,
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            onPressed: () {
              setState(() {
                Navigator.pushNamed(context, '/payment');
              });
            },
            child: Row(
              children: [
                Text(
                  "Pay",
                  style: AppText.subtitle(),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.credit_card,
                  size: 16,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
