import 'package:bcc/Function/Tes.dart';
import 'package:bcc/Function/Uang.dart';
import 'package:bcc/class/Product.dart';
import 'package:bcc/components/showNotif.dart';
import 'package:bcc/layout/detailProduct/ProductBuy.dart';
import 'package:bcc/layout/detailProduct/ProductDesc.dart';
import 'package:bcc/layout/detailProduct/ProductDetail.dart';
import 'package:bcc/layout/detailProduct/ProductImage.dart';
import 'package:bcc/layout/detailProduct/ProductNav.dart';
import 'package:bcc/layout/detailProduct/ProductTitle.dart';
import 'package:bcc/providers/ProviderBasket.dart';
import 'package:bcc/providers/ProviderDetail.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailProductScreen extends StatefulWidget {
  DetailProductScreen({Key? key}) : super(key: key);

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  int jumlah = 0;

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Product;
    var basket = Provider.of<ProviderBasket>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(
              ID: data.ID,
              link_foto: data.link_foto,
            ),
            ProductTitle(
              data: data,
            ),
            divider,

            // Buy
            Container(
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
            ),

            //==== ====
            divider,
            ProductDescription(
              desc: data.deskripsi,
            ),
            divider,
            ProductDetail(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
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
                  "${uang(data.harga_barang * jumlah)}",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "$jumlah item",
                  style: AppText.subtitle(
                    color: AppColor.textSecondary,
                  ),
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: ElevatedButton(
                onPressed: () {
                  if (jumlah == 0) {
                    showAlert("Tidak bisa menambahkan barang", context,
                        isFalse: true);
                  } else {
                    setState(() {
                      Navigator.pushNamed(context, '/basket');
                      basket.add(jumlah, data);
                    });
                  }
                },
                child: Row(
                  children: [
                    Text(
                      "Add to basket",
                      style: AppText.title(),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.shopping_basket_outlined,
                      size: 16,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  var divider = Container(
    width: double.infinity,
    height: 1,
    color: AppColor.secondary1,
  );
}
