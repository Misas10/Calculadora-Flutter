import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class InputNumber extends ChangeNotifier {
  String _labelNum = "";
  double _firstNumber = 0;
  // Tell Which operation is the user making
  String _whichOperation = '';

  String get num => _labelNum;

  // Add a character to the var _num
  addNum(String num) {
    _labelNum += num;
    notifyListeners();
  }

  // Set the variable _num to some other value
  setNum(String value) {
    _labelNum = value;
    notifyListeners();
  }

  som() {
    _whichOperation = '+';
    if (_labelNum != "") {
      _firstNumber = double.parse(_labelNum);
      setNum('');
    }
    // debugPrint(_firstNumber.toString());
  }

  subtr() {
    _whichOperation = '-';
    if (_labelNum != "") {
      _firstNumber = double.parse(_labelNum);
      setNum('');
    }
  }

  div() {
    _whichOperation = '/';
    if (_labelNum != "") {
      _firstNumber = double.parse(_labelNum);
      setNum('');
    }
  }

  multipl() {
    _whichOperation = '*';
    if (_labelNum != "") {
      _firstNumber = double.parse(_labelNum);
      setNum('');
    }
  }

  // delete the last character(s)
  del() {
    if (_labelNum != "" && _labelNum.length > 0) {
      _labelNum = _labelNum.substring(0, _labelNum.length - 1);
      notifyListeners();
    }
  }

  result() {
    // Select corrent operation
    switch (_whichOperation) {
      case '+':
        {
          _labelNum = (_firstNumber + double.parse(_labelNum)).toString();
          // debugPrint((_firstNumber + double.parse(_labelNum)).toString());
          notifyListeners();
          return;
        }
      case '-':
        {
          _labelNum = (_firstNumber - double.parse(_labelNum)).toString();
          notifyListeners();
          return;
        }
      case '/':
        {
          _labelNum = (_firstNumber / double.parse(_labelNum)).toString();
          notifyListeners();
          return;
        }
      case '*':
        {
          _labelNum = (_firstNumber * double.parse(_labelNum)).toString();
          notifyListeners();
          return;
        }
      default:
        {
          return;
        }
    }
  }
}
