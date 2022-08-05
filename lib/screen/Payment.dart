import 'package:bcc/components/PaymentNav.dart';
import 'package:bcc/components/PaymentNav2.dart';
import 'package:bcc/layout/payment/CardPayment.dart';
import 'package:bcc/layout/payment/PaymentHeader.dart';
import 'package:bcc/layout/profile/PaymentMethod.dart';
import 'package:bcc/providers/ProviderBasket.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    var basket = Provider.of<ProviderBasket>(context, listen: false);

    int harga = 0;
    basket.data.forEach((e) {
      harga += e.amount * e.product.harga_barang;
    });

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
              ...basket.data.map((e) {
                return CardPayment(
                  data: e,
                );
              }).toList(),
              Divider(
                color: AppColor.secondary1,
                thickness: 1,
              ),
              PaymentMethod(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PaymentNav2(harga, basket.data.length),
    );
  }
}
