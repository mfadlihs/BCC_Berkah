import 'package:bcc/components/PaymentNav.dart';
import 'package:bcc/components/basket/CardBasket.dart';
import 'package:bcc/layout/basket/BasketHeader.dart';
import 'package:bcc/layout/detailProduct/ProductNav.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasketScreen extends StatefulWidget {
  BasketScreen({Key? key}) : super(key: key);

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Column(
              children: [
                BasketHeader(),
                Divider(
                  color: AppColor.secondary1,
                  thickness: 1,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      ...[1].map((e) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 14),
                          child: CardBasket(),
                        );
                      }).toList(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: PaymentNav(),
    );
  }
}
