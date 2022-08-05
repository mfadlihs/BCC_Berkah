import 'package:bcc/providers/ProviderDelivery.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CouponScreen extends StatefulWidget {
  CouponScreen({Key? key}) : super(key: key);

  @override
  State<CouponScreen> createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {
  @override
  Widget build(BuildContext context) {
    var providerDelivery = Provider.of<ProviderDelivery>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
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
                    Text("Voucher", style: AppText.subheader()),
                  ],
                ),
                SizedBox(height: 12),
                ...[
                  1,
                  2,
                  3,
                ].map((e) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () {
                        print("wkwkwk");
                        providerDelivery.setDiskon(0.3);
                        Navigator.pop(context);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset("images/coupon.png"),
                      ),
                    ),
                  );
                }).toList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
