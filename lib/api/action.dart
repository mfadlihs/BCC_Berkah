import 'dart:convert';

import 'package:bcc/api/baseUrl.dart';
import 'package:bcc/api/token.dart';
import 'package:bcc/class/Product.dart';
import 'package:bcc/class/Toko.dart';
import 'package:bcc/class/User.dart';
import 'package:bcc/providers/ListProduct.dart';
import 'package:http/http.dart' as http;

getAllProduct(ListProduct provider) async {
  var token = await getToken();

  try {
    var response = await http.get(
      Uri.https(baseUrl, "barang/all"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    List result = await json.decode(response.body)['body'];
    List<Product> products = [];
    result.forEach((e) {
      products.add(Product(
        ID: e['ID'],
        id_toko_sampah: e['id_toko_sampah'],
        link_foto: e['link_foto'],
        nama_barang: e['nama_barang'],
        harga_barang: e['harga_barang'],
        tipe_barang: e['tipe_barang'],
        deskripsi: e['deskripsi'],
      ));
    });

    provider.setProduct(products);

    return products;
  } catch (e) {
    print(e);
  }
}

Future getProductAsync() async {
  var token = await getToken();

  var response = await http.get(
    Uri.https(baseUrl, "barang/all"),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  List result = await json.decode(response.body)['body'];
  List<Product> products = [];
  result.forEach((e) {
    products.add(Product(
      ID: e['ID'],
      id_toko_sampah: e['id_toko_sampah'],
      link_foto: e['link_foto'],
      nama_barang: e['nama_barang'],
      harga_barang: e['harga_barang'],
      tipe_barang: e['tipe_barang'],
      deskripsi: e['deskripsi'],
    ));
  });

  return products;
}

getAllToko(ListProduct provider) async {
  var token = await getToken();

  try {
    var response = await http.get(
      Uri.https(baseUrl, "toko_sampah/all"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    List<Toko> toko = [];

    List result = await json.decode(response.body)['body'];

    result.forEach((e) {
      List<int> BarangJualans = [];
      e['BarangJualans'].forEach((e) {
        BarangJualans.add(e['ID']);
      });
      toko.add(Toko(e['ID'], e['nama_toko'], e['alamat_toko'], BarangJualans));
    });

    provider.setToko(toko);
  } catch (e) {
    print(e);
  }
}

Future getTokoAsync() async {
  var token = await getToken();

  var response = await http.get(
    Uri.https(baseUrl, "toko_sampah/all"),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  List<Toko> toko = [];

  List result = await json.decode(response.body)['body'];

  result.forEach((e) {
    List<int> BarangJualans = [];
    e['BarangJualans'].forEach((e) {
      BarangJualans.add(e['ID']);
    });
    toko.add(Toko(e['ID'], e['nama_toko'], e['alamat_toko'], BarangJualans));
  });

  return toko;
}

Future getUser() async {
  var token = await getToken();

  var response = await http.get(
    Uri.https(baseUrl, "metadata/profile"),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  var result = await json.decode(response.body)['body'];

  var pengguna = result['User'];
  var toko = result['TokoSampah'];

  User user = User(
      result['ID'],
      pengguna['id_meta_user'],
      pengguna['nama'],
      pengguna['tanggal_lahir'],
      pengguna['alamat'],
      pengguna['gender'],
      pengguna['link_foto'],
      toko['nama_toko'],
      toko['alamat_toko'],
      result['email'], []);

  return user;
}
