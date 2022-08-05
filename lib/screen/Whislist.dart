import 'package:bcc/components/Navbar.dart';
import 'package:bcc/components/Search.dart';
import 'package:bcc/components/home/ProductCard.dart';
import 'package:bcc/providers/ListProduct.dart';
import 'package:bcc/themes/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatefulWidget {
  WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    var listProduct = Provider.of<ListProduct>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Search(hintText: "Search on Whislist"),
                SizedBox(height: 16),
                Text(
                  "${listProduct.favourites.length} Products",
                  style: AppText.title(),
                ),
                SizedBox(height: 8),
                GridView.count(
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  padding: EdgeInsets.zero,
                  children: [
                    ...listProduct.favourites
                        .map((e) => ProductCard(e))
                        .toList(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Navbar(index: 3),
    );
  }
}


/*
GridView.count(
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      padding: EdgeInsets.zero,
                      children: [
                        ...[1, 2, 3, 4, 5, 6, 7, 8, 9]
                            .map((e) => ProductCard(e))
                            .toList(),
                      ],
                    ),
*/