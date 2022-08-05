import 'dart:convert';

import 'package:bcc/api/baseUrl.dart';
import 'package:bcc/api/token.dart';
import 'package:bcc/class/Toko.dart';
import 'package:bcc/components/Navbar.dart';
import 'package:bcc/layout/detailStore/StoreContent.dart';
import 'package:bcc/layout/detailStore/StoreHeader.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class DetailStore extends StatefulWidget {
  DetailStore({Key? key}) : super(key: key);

  @override
  State<DetailStore> createState() => _DetailStoreState();
}

class _DetailStoreState extends State<DetailStore> {
  void getToko(int id) async {
    var token = await getToken();

    var request = await http.get(
      Uri.https(baseUrl, 'toko_sampah/single/$id'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    print(json.decode(request.body));
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as List;
    int ID = data[2];

    getToko(ID);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              StoreHeader(
                data[1] + 1,
                data: data[0],
              ),
              StoreContent(data[0]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
