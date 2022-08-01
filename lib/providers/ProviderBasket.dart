import 'package:flutter/cupertino.dart';

class ProviderBasket extends ChangeNotifier {
  List<BasketItem> data = [];

  void add(int id, int amount) {
    var item = BasketItem(id, amount);
    data.add(item);

    notifyListeners();
  }
}

class BasketItem {
  int id;
  int amount;

  BasketItem(this.id, this.amount);
}
