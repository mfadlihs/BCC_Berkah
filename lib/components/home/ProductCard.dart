import 'package:bcc/Function/Uang.dart';
import 'package:bcc/class/Product.dart';
import 'package:bcc/components/showNotif.dart';
import 'package:bcc/providers/ListProduct.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  Product data;

  ProductCard(this.data, {Key? key}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState(data);
}

class _ProductCardState extends State<ProductCard> {
  void navigate(BuildContext context) {
    Navigator.pushNamed(context, '/detail-product', arguments: data);
  }

  bool isFavorite = false;

  Product data;

  _ProductCardState(this.data);

  @override
  Widget build(BuildContext context) {
    var listProduct = Provider.of<ListProduct>(context, listen: false);

    if (listProduct.checkFavorite(data.ID)) {
      isFavorite = true;
    }

    return InkWell(
      onTap: () {
        navigate(context);
      },
      child: Container(
        width: double.infinity,
        height: 180,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: BorderSide(
              color: AppColor.secondary1,
              width: 1,
            ),
          ),
          child: Stack(
            children: [
              Hero(
                tag: data.ID,
                child: Image.network(
                  data.link_foto,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    border: Border.all(
                      color: AppColor.secondary1,
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.tipe_barang,
                            style: AppText.desc(),
                          ),
                          Text(
                            data.nama_barang,
                            style: AppText.body(),
                          ),
                          Text(
                            uang(data.harga_barang),
                            style: AppText.body(color: AppColor.primary),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.shopping_basket_outlined,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: InkWell(
                  onTap: () {
                    // print('wkwkw');
                    if (isFavorite) {
                      listProduct.unfavourite(data);
                      setState(() {
                        isFavorite = false;
                      });
                      showAlert("Menghapus dari wishlist", context);
                    } else {
                      listProduct.favourite(data);
                      setState(() {
                        isFavorite = true;
                      });
                      showAlert("Berhasil menambahkan ke wishlist", context);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: AppColor.secondary1,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                      size: 12,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 27,
                left: 0,
                child: Container(
                  padding:
                      EdgeInsets.only(top: 1, bottom: 1, left: 3, right: 6),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/Home/discount.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text(
                    "15%",
                    style: AppText.body(color: AppColor.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
