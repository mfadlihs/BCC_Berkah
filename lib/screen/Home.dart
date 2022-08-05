import 'dart:convert';

import 'package:bcc/api/action.dart';
import 'package:bcc/api/baseUrl.dart';
import 'package:bcc/api/token.dart';
import 'package:bcc/class/Product.dart';
import 'package:bcc/class/Toko.dart';
import 'package:bcc/components/Navbar.dart';
import 'package:bcc/layout/home/HomeHeader.dart';
import 'package:bcc/layout/home/HomeHeading.dart';
import 'package:bcc/layout/home/HomeJumbotron.dart';
import 'package:bcc/layout/home/PopularProduct.dart';
import 'package:bcc/layout/home/PopularStore.dart';
import 'package:bcc/providers/ListProduct.dart';
import 'package:bcc/themes/AppColors.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int angka = 1;

  @override
  Widget build(BuildContext context) {
    var listProduct = Provider.of<ListProduct>(context, listen: false);
    getAllProduct(listProduct);
    getAllToko(listProduct);

    int sizeProduct = listProduct.products.length;
    int sizeStore = listProduct.toko.length;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeading,
              SizedBox(
                height: 16,
              ),
              HomeHeader,
              HomeJumbotron,

              sizeProduct == 0
                  ? FutureBuilder(
                      future: getProductAsync(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return PopularProductWaiting();
                        } else {
                          var data = snapshot.data as List<Product>;

                          return PopularProduct(data: data);
                        }
                      },
                    )
                  : PopularProduct(
                      data: listProduct.products,
                    ),

              // popular product
              sizeStore == 0
                  ? FutureBuilder(
                      future: getTokoAsync(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return PopularStoreWaiting();
                        } else {
                          var data = snapshot.data as List<Toko>;

                          return PopularStore(data: data);
                        }
                      },
                    )
                  : PopularStore(
                      data: listProduct.toko,
                    ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Navbar(
        index: 1,
      ),
    );
  }
}
