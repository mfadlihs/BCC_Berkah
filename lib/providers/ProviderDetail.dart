import 'package:flutter/cupertino.dart';

class ProviderDetail extends ChangeNotifier {
  int amount = 0;

  void addAmount() {
    amount++;
    notifyListeners();
  }

  void removeAmount() {
    amount--;
    notifyListeners();
  }
}
