// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionsList extends ChangeNotifier {
  bool isTapped = false;
  List<Map<String, dynamic>> questionList = [];

  void addQuesiton(Map<String, dynamic> question) {
    questionList.add(question);
    notifyListeners();
  }

  void removeQuestion() {
    questionList.removeLast();
    notifyListeners();
  }

  void Tapped() {
    if (isTapped == true) {
      isTapped = false;
    } else {
      isTapped = true;
    }
    notifyListeners();
  }

  bool get getTapped => isTapped;

  List<Map<String, dynamic>> get getList => questionList;
}