import 'package:bcc/class/Product.dart';
import 'package:bcc/class/Toko.dart';
import 'package:flutter/cupertino.dart';

class ListProduct extends ChangeNotifier {
  List<Product> products = [];

  List<Toko> toko = [];

  List<Product> favourites = [];

  void setProduct(List<Product> products) {
    this.products = products;

    notifyListeners();
  }

  void setToko(List<Toko> toko) {
    this.toko = toko;

    notifyListeners();
  }

  bool checkFavorite(int ID) {
    if (favourites.length == 0) {
      return false;
    }

    bool isUnique = false;

    favourites.forEach((e) {
      if (e.ID == ID) {
        isUnique = true;
      }
    });

    return isUnique;
  }

  void favourite(Product product) {
    favourites.forEach((e) {
      if (e.ID == product.ID) return;
    });

    favourites.add(product);
    notifyListeners();
  }

  void unfavourite(Product product) {
    late int index;
    favourites.asMap().forEach((key, value) {
      if (value.ID == product.ID) {
        index = key;
      }
    });

    favourites.removeAt(index);

    notifyListeners();
  }
}
