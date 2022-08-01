import 'package:bcc/Function/Uang.dart';
import 'package:bcc/providers/ProviderDetail.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductBuy extends StatefulWidget {
  ProductBuy({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductBuy> createState() => _ProductBuyState();
}

class _ProductBuyState extends State<ProductBuy> {
  num harga = 625000;
  int jumlah = 1;

  @override
  Widget build(BuildContext context) {
    var amount = Provider.of<ProviderDetail>(context, listen: true);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            disabledColor: AppColor.gray,
            onPressed: jumlah >= 1
                ? () {
                    setState(() {
                      jumlah--;
                      amount.removeAmount();
                    });
                  }
                : null,
            icon: Icon(
              Icons.remove,
              size: 16,
              color: AppColor.secondary2,
            ),
          ),
          SizedBox(width: 20),
          Text(
            "${jumlah}",
            style: AppText.header(),
          ),
          SizedBox(width: 20),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                jumlah++;
                amount.addAmount();
              });
            },
            icon: Icon(
              Icons.add,
              color: AppColor.secondary2,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
