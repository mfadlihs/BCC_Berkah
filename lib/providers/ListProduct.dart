import 'package:bcc/class/Product.dart';
import 'package:bcc/class/Toko.dart';
import 'package:flutter/cupertino.dart';

class ListProduct extends ChangeNotifier {
  List<Product> products = [
    Product(
      1,
      1,
      "Botol Plastik",
      1000,
      "Botol plastik adalah sebuah botol yang terbuat dari plastik. Botol plastik biasanya dipakai untuk menyimpan cairan seperti air, minuman ringan, oli motor, minyak masak, obat, sampo, susu dan tinta. Ukurannya beragam dari botol sampel yang sangat kecil sampai carboy besar.",
      3,
    ),
    Product(
      2,
      1,
      "Biji Plastik 25kg ",
      600000,
      "Biji plastik merupakan bahan yang umumnya berupa butiran-butiran berwarna putih bening dan merupakan bahan utama pembuatan produk-produk yang berbahan dasar plastik baik produk rumah tangga, produk elektronik, produk otomotif maupun produk yang lain.",
      1,
    ),
    Product(
      3,
      1,
      "Kertas Buram",
      500,
      "Kertas Buram merupakan jenis kertas dari proses daur ulang. Fungsi kertas Buram ini kebanyakan dan biasanya hanya digunakan untuk coret-coretan atau hanya digunakan sementara dipakai terus dibuang.",
      2,
    ),
    Product(
      4,
      2,
      "Logam 1kg",
      200000,
      "Dalam kimia, sebuah logam adalah material (sebuah unsur, senyawa, atau paduan) yang biasanya keras tak tembus cahaya, berkilau, dan memiliki konduktivitas listrik dan termal yang baik. Logam umumnya liat—yaitu dapat ditempa atau ditekan permanen hingga berubah bentuk tanpa patah atau retak—dan juga fusibel ",
      1,
    ),
    Product(
      5,
      2,
      "Kaleng",
      5000,
      "Kaleng adalah lembaran baja yang disalut timah. Bagi orang awam, kaleng sering diartikan sebagai tempat penyimpanan atau wadah yang terbuat dari logam dan digunakan untuk mengemas makanan, minuman, atau produk lain. Dalam pengertian ini, kaleng juga termasuk wadah yang terbuat dari aluminium.",
      2,
    ),
    Product(
      6,
      2,
      "Pakaian",
      300000,
      "Pakaian adalah bahan tekstil dan serat yang digunakan sebagai penutup tubuh. Pakaian merupakan kebutuhan pokok manusia selain makanan dan tempat berteduh/tempat tinggal.",
      3,
    ),
    Product(
      7,
      2,
      "Kaca",
      15000,
      "Kaca berasal dari bahan yang bersifat cair namun memiliki kepadatan tinggi, dan struktur amorf. Atom-atom di dalamnya tidak membentuk suatu jalinan yang beraturan, seperti kristal, atau biasa disebut gelas.",
      2,
    ),
    Product(
      8,
      3,
      "Rotan",
      20000,
      "Rotan adalah sekelompok palma dari puak Calameae yang memiliki habitus memanjat, terutama Calamus, Daemonorops, dan Oncocalamus. Puak Calameae sendiri terdiri dari sekitar enam ratus anggota, dengan daerah persebaran di bagian tropis Afrika, Asia dan Australasia",
      2,
    ),
    Product(
      9,
      3,
      "Besi 1kg",
      40000,
      "Besi adalah unsur kimia dengan simbol Fe dan nomor atom 26. Merupakan logam dalam deret transisi pertama. Ini adalah unsur paling umum di bumi berdasarkan massa, membentuk sebagian besar bagian inti luar dan dalam bumi. Besi adalah unsur keempat terbesar pada kerak bumi.",
      1,
    ),
    Product(
      10,
      3,
      "Kayu",
      10000,
      "Kayu adalah bagian batang atau cabang serta ranting tumbuhan yang mengeras karena mengalami lignifikasi. Kayu digunakan untuk berbagai keperluan, mulai dari memasak, membuat perabot, bahan bangunan, bahan kertas, dan banyak lagi.",
      1,
    ),
    Product(
      11,
      3,
      "Bambu",
      20000,
      "Bambu, buluh, atau aur adalah tumbuhan berbunga menahun hijau abadi dari subfamili Bambusoideae yang termasuk famili Poaceae. Bambu dikenal juga dengan istilah preng atau pring dalam bahasa Jawa, awi atau tamiang dalam bahasa Sunda, tabatiko dalam bahasa Ternate, dan ute dalam bahasa Ambon",
      2,
    ),
  ];

  List<Toko> toko = [
    Toko(
      1,
      "Toko Barokah",
      "Surabaya",
      [1, 2, 3],
    ),
    Toko(
      2,
      "Toko Jaya Selalu",
      "Cilegon",
      [4, 5, 6, 7],
    ),
    Toko(
      3,
      "Toko Sumbersari",
      "Sumenep",
      [8, 9, 10, 11],
    ),
  ];

  void favourite(int id) {
    products.forEach((e) {
      if (e.id == id) {
        e.isFavourite = true;
      }
    });

    notifyListeners();
  }

  void unFavourite(int id) {
    products.forEach((e) {
      if (e.id == id) {
        e.isFavourite = false;
      }
    });

    notifyListeners();
  }
}
