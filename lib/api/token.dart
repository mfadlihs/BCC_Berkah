import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token')!;
}

Future setToken(String value) async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setString('token', value);
}
