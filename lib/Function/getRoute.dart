import 'package:flutter/cupertino.dart';

getRoute(BuildContext context) {
  return ModalRoute.of(context)!.settings.name;
}
