import 'package:bcc/Function/Uang.dart';
import 'package:bcc/providers/ProviderDelivery.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentNav3 extends StatefulWidget {
  int totalHarga;
  int jumlah;
  PaymentNav3(this.totalHarga, this.jumlah, {Key? key}) : super(key: key);

  @override
  State<PaymentNav3> createState() => _PaymentNav3State();
}

class _PaymentNav3State extends State<PaymentNav3> {
  @override
  Widget build(BuildContext context) {
    var providerDelivery = Provider.of<ProviderDelivery>(context);

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
                "${uang((widget.totalHarga + providerDelivery.ongkir) * (1 - providerDelivery.diskon))}",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 2),
              Text(
                "${widget.jumlah} item",
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
                Navigator.pushNamed(context, '/waiting-verification');
              });
            },
            child: Row(
              children: [
                Text(
                  "Confirm",
                  style: AppText.subtitle(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
