import 'package:bcc/Function/Uang.dart';
import 'package:bcc/components/showNotif.dart';
import 'package:bcc/providers/ProviderDelivery.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentNav2 extends StatefulWidget {
  int totalHarga;
  int jumlah;
  PaymentNav2(this.totalHarga, this.jumlah, {Key? key}) : super(key: key);

  @override
  State<PaymentNav2> createState() => _PaymentNav2State();
}

class _PaymentNav2State extends State<PaymentNav2> {
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
              if (providerDelivery.ongkir == 0) {
                showAlert("Masukkan delivery terlebih dahulu", context,
                    isFalse: true);

                return;
              }
              setState(() {
                Navigator.pushNamed(context, '/payment-proof');
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
