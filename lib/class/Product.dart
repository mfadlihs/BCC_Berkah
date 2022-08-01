class Product {
  int idToko;
  String name;
  int harga;
  String desc;
  int _type;
  int id;
  bool isFavourite = false;

  Product(this.id, this.idToko, this.name, this.harga, this.desc, this._type);

  String type() {
    if (_type == 1) {
      return "Recycling Trash";
    } else if (_type == 2) {
      return "Semi-Recycling Trash";
    } else {
      return "Non-Recycling Trash";
    }
  }
}
