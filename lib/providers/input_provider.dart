import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class InputNumber extends ChangeNotifier {
  String _num = "";

  String get num => _num;

  // Add a character to the var _num
  addNum(String num) {
    _num += num;
    notifyListeners();
  }

  // Set the variable _num to some other value
  setNum(String value) {
    _num = value;
    notifyListeners();
  }

  som() {}

  subtr() {}

  div() {}

  multipl() {}

  // delete the last character(s)
  del() {
    debugPrint(_num);
    if (_num != "" && _num.length > 0) {
      _num = _num.substring(0, _num.length - 1);
      notifyListeners();
    }
  }
}
