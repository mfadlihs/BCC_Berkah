import 'package:bcc/class/Product.dart';
import 'package:bcc/providers/ProviderBasket.dart';
import 'package:flutter/cupertino.dart';

class ProviderOrder extends ChangeNotifier {
  List<BasketItem> data = [];

  void setData(List<BasketItem> data) {
    this.data = data;

    notifyListeners();
  }
}
