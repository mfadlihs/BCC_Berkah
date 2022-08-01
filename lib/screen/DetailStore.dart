import 'package:bcc/class/Toko.dart';
import 'package:bcc/components/Navbar.dart';
import 'package:bcc/layout/detailStore/StoreContent.dart';
import 'package:bcc/layout/detailStore/StoreHeader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailStore extends StatefulWidget {
  DetailStore({Key? key}) : super(key: key);

  @override
  State<DetailStore> createState() => _DetailStoreState();
}

class _DetailStoreState extends State<DetailStore> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Toko;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              StoreHeader(data.id),
              StoreContent(data),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
