import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/material.dart';

class CardPayment extends StatefulWidget {
  CardPayment({Key? key}) : super(key: key);

  @override
  State<CardPayment> createState() => _CardPaymentState();
}

class _CardPaymentState extends State<CardPayment> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Toko Botol Plastik",
            style: AppText.subtitle(),
          ),
          SizedBox(height: 4),
          RichText(
            text: TextSpan(
              text: "• ",
              style: AppText.desc(color: AppColor.secondary2),
              children: [
                TextSpan(
                  text: "Surabaya",
                  style: TextStyle(color: AppColor.textSecondary),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset("images/product_icon.png", width: 71),
              ),
              SizedBox(width: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Biji Plastik 25kg",
                    style: AppText.subheader(),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Rp 625.000",
                    style: AppText.subtitle(color: AppColor.secondary2),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "1 barang",
                    style: AppText.body(color: AppColor.textSecondary),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
