import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier {
  int value = 5;

  void increment() {
    this.value++;
    notifyListeners();
  }
}
