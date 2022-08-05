import 'package:bcc/Function/Uang.dart';
import 'package:bcc/class/Product.dart';
import 'package:bcc/class/Toko.dart';
import 'package:bcc/providers/ListProduct.dart';
import 'package:bcc/providers/ProviderBasket.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardPayment extends StatefulWidget {
  BasketItem data;
  CardPayment({Key? key, required this.data}) : super(key: key);

  @override
  State<CardPayment> createState() => _CardPaymentState();
}

class _CardPaymentState extends State<CardPayment> {
  @override
  Widget build(BuildContext context) {
    var listProduct = Provider.of<ListProduct>(context, listen: false);
    BasketItem data = widget.data;

    List<Toko> toko = [];

    listProduct.toko
        .where((e) => e.ID == data.product.id_toko_sampah)
        .forEach((e) {
      toko.add(e);
    });

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            toko[0].nama_toko,
            style: AppText.subtitle(),
          ),
          SizedBox(height: 4),
          RichText(
            text: TextSpan(
              text: "• ",
              style: AppText.desc(color: AppColor.secondary2),
              children: [
                TextSpan(
                  text: toko[0].alamat_toko,
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
                child: Image.network(data.product.link_foto, width: 71),
              ),
              SizedBox(width: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.product.nama_barang,
                    style: AppText.subheader(),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "${uang(data.product.harga_barang * data.amount)}",
                    style: AppText.subtitle(color: AppColor.secondary2),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "${data.amount} barang",
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
