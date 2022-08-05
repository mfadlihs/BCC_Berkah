import 'package:bcc/Function/Uang.dart';
import 'package:bcc/class/Toko.dart';
import 'package:bcc/providers/ListProduct.dart';
import 'package:bcc/providers/ProviderBasket.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardBasket extends StatefulWidget {
  BasketItem data;

  CardBasket(this.data, {Key? key}) : super(key: key);

  @override
  State<CardBasket> createState() => _CardBasketState();
}

class _CardBasketState extends State<CardBasket> {
  bool isChecked = true;

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

    return Container(
      padding: EdgeInsets.only(top: 14, right: 14, left: 14, bottom: 16),
      decoration: BoxDecoration(
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 6,
            color: Color.fromRGBO(0, 0, 0, .25),
          )
        ],
        border: Border.all(
          width: 1,
          color: AppColor.primary,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? val) {
                      setState(() {
                        isChecked = val!;
                      });
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    checkColor: AppColor.textPrimary,
                    activeColor: AppColor.primary,
                  ),
                  SizedBox(width: 6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${toko[0].nama_toko}",
                        style: AppText.subtitle(),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "• ",
                          style: AppText.desc(color: AppColor.secondary2),
                          children: [
                            TextSpan(
                              text: "${toko[0].alamat_toko}",
                              style: TextStyle(color: AppColor.textSecondary),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.rotate(
                angle: 40,
                child: Icon(
                  Icons.add_circle,
                  size: 20,
                  color: AppColor.textSecondary,
                ),
              ),
            ],
          ),
          SizedBox(height: 18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (bool? val) {
                  setState(() {
                    isChecked = val!;
                  });
                },
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                checkColor: AppColor.textPrimary,
                activeColor: AppColor.primary,
              ),
              SizedBox(width: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "${data.product.link_foto}",
                  width: 48,
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.product.nama_barang,
                    style: AppText.subtitle(),
                  ),
                  Text(
                    "${uang(data.product.harga_barang * data.amount)}",
                    style: AppText.body(color: AppColor.secondary2),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                constraints: BoxConstraints(),
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.remove,
                  size: 16,
                  color: AppColor.secondary2,
                ),
              ),
              SizedBox(width: 30),
              Text(
                "${data.amount}",
                style: AppText.subheader(),
              ),
              SizedBox(width: 30),
              IconButton(
                onPressed: () {},
                constraints: BoxConstraints(),
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.add,
                  size: 16,
                  color: AppColor.secondary2,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
