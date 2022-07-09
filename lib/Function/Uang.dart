import 'package:intl/intl.dart';

class Uang {
  static format(num angka) {
    return NumberFormat.currency(locale: "id", symbol: "RP ", decimalDigits: 0)
        .format(angka);
  }
}
