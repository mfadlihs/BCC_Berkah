import 'package:bcc/class/Product.dart';

class AppState {
  final List<Product> products;
  final List<Product> favourites;

  AppState({this.products = const [], this.favourites = const []});
}
