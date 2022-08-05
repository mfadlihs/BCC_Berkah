import 'package:bcc/class/Product.dart';
import 'package:flutter/cupertino.dart';

class ProviderBasket extends ChangeNotifier {
  List<BasketItem> data = [];

  void add(int amount, Product product) {
    var item = BasketItem(amount, product);
    data.add(item);

    notifyListeners();

    print(data);
  }
}

class BasketItem {
  int amount;
  Product product;

  BasketItem(this.amount, this.product);
}
