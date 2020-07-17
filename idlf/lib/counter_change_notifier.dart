import 'package:flutter/cupertino.dart';

//Provider step1 先定義一個廣播器
class CounterChangeNotifier with ChangeNotifier {

  int count = 0;

  increment() {
    count++;
    notifyListeners();
  }
}