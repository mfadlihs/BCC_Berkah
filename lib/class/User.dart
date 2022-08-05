import 'package:bcc/class/Product.dart';

class User {
  int ID;
  int id_meta_user;
  String nama;
  String tanggal_lahir;
  String alamat;
  String gender;
  String link_foto;
  String nama_toko;
  String alamat_toko;
  String email;
  List<Product> BarangJualans;

  User(
      this.ID,
      this.id_meta_user,
      this.nama,
      this.tanggal_lahir,
      this.alamat,
      this.gender,
      this.link_foto,
      this.nama_toko,
      this.alamat_toko,
      this.email,
      this.BarangJualans);
}
