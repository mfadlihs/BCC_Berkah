import 'package:bcc/components/PaymentNav.dart';
import 'package:bcc/components/PaymentNav2.dart';
import 'package:bcc/layout/payment/CardPayment.dart';
import 'package:bcc/layout/payment/PaymentHeader.dart';
import 'package:bcc/layout/profile/PaymentMethod.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PaymentHeader(),
              Divider(
                color: AppColor.secondary1,
                thickness: 1,
              ),
              CardPayment(),
              Divider(
                color: AppColor.secondary1,
                thickness: 1,
              ),
              PaymentMethod(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PaymentNav2(),
    );
  }
}


/*
Container(
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
                "Rp 625.000",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 2),
              Text(
                "${Tes.angka} item",
                style: AppText.subtitle(
                  color: AppColor.textSecondary,
                ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  // widget.angka++;
                });
              },
              child: Row(
                children: [
                  Text(
                    "Add to basket",
                    style: AppText.title(),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.shopping_basket_outlined,
                    size: 16,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    )

 */