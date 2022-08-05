import 'package:flutter/cupertino.dart';

class ProviderDelivery extends ChangeNotifier {
  num ongkir = 0;
  num diskon = 0;

  void setOngkir(num ongkir) {
    this.ongkir = ongkir;

    notifyListeners();
  }

  void setDiskon(num diskon) {
    this.diskon = diskon;
    notifyListeners();
  }
}
