import 'package:bcc/Function/Uang.dart';
import 'package:bcc/class/Product.dart';
import 'package:bcc/components/showNotif.dart';
import 'package:bcc/providers/ListProduct.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTitle extends StatefulWidget {
  Product data;
  ProductTitle({Key? key, required this.data}) : super(key: key);

  _ProductTitle createState() => _ProductTitle();
}

class _ProductTitle extends State<ProductTitle> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    var listProduct = Provider.of<ListProduct>(context);
    var _data = widget.data;

    if (listProduct.checkFavorite(widget.data.ID)) {
      isFavorite = true;
    }

    return Padding(
      padding: EdgeInsets.only(
        top: 15,
        bottom: 15,
        left: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _data.tipe_barang,
                style: AppText.subtitle(
                  color: AppColor.textSecondary,
                ),
              ),
              SizedBox(height: 8),
              Text(
                _data.nama_barang,
                style: AppText.header(),
              ),
              SizedBox(height: 8),
              Text(
                uang(_data.harga_barang),
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor.secondary2,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          MaterialButton(
            color: AppColor.secondary1,
            onPressed: () {
              if (isFavorite) {
                listProduct.unfavourite(widget.data);
                setState(() {
                  isFavorite = false;
                });
                showAlert("Menghapus dari wishlist", context);
              } else {
                listProduct.favourite(widget.data);
                setState(() {
                  isFavorite = true;
                });
                showAlert("Berhasil menambahkan ke wishlist", context);
              }
            },
            shape: CircleBorder(),
            child: Padding(
              padding: EdgeInsets.all(6),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_outline,
                color: Colors.red,
                size: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
