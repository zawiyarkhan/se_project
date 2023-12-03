import 'dart:math';

import 'package:flutter/cupertino.dart';

class GenerateCodeProvider extends ChangeNotifier {
  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String code = "";

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  void generteCode() {
    code = getRandomString(6);
    notifyListeners();
  }

  String get getCode => code;
}