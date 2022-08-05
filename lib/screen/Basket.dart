import 'package:bcc/components/PaymentNav.dart';
import 'package:bcc/components/basket/CardBasket.dart';
import 'package:bcc/layout/basket/BasketHeader.dart';
import 'package:bcc/layout/detailProduct/ProductNav.dart';
import 'package:bcc/providers/ProviderBasket.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasketScreen extends StatefulWidget {
  BasketScreen({Key? key}) : super(key: key);

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
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
                      ...basket.data.map((e) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 14),
                          child: CardBasket(e),
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
      bottomNavigationBar: PaymentNav(harga, basket.data.length),
    );
  }
}
