// class Product {
//   int idToko;
//   String name;
//   int harga;
//   String desc;
//   int _type;
//   int id;
//   bool isFavourite = false;

//   Product(this.id, this.idToko, this.name, this.harga, this.desc, this._type);

//   String type() {
//     if (_type == 1) {
//       return "Recycling Trash";
//     } else if (_type == 2) {
//       return "Semi-Recycling Trash";
//     } else {
//       return "Non-Recycling Trash";
//     }
//   }
// }

class Product {
  int ID;
  int id_toko_sampah;
  String link_foto;
  String nama_barang;
  int harga_barang;
  String tipe_barang;
  String deskripsi;

  Product({
    required this.ID,
    required this.id_toko_sampah,
    required this.link_foto,
    required this.nama_barang,
    required this.harga_barang,
    required this.tipe_barang,
    required this.deskripsi,
  });
}


/*
ID": 1,
      "CreatedAt": "2022-07-21T10:30:36.187863Z",
      "UpdatedAt": "2022-07-21T10:30:36.187863Z",
      "DeletedAt": null,
      "id_toko_sampah": 1,
      "link_foto": "https://jgjyjvyldoamqndazixl.supabase.co/storage/v1/object/public/foto-proker/profileSampahPertama2.jpg20220721173034",
      "nama_barang": "Sampah Pertama",
      "harga_barang": 99999,
      "stok_barang": 99999,
      "tipe_barang": "Test",
      "deskripsi": "Test"
*/