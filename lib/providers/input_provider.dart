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

  // Change the signal of the number
  isPositive() {
    if (_labelNum != '') {
      _whichOperation = "+/-";
      _labelNum = (double.parse(_labelNum) * -1).toString();
      notifyListeners();
    }
  }

  // percentage button
  perc() {
    if (_labelNum != '') {
      _labelNum = (double.parse(_labelNum) / 100).toString();
      notifyListeners();
    }
  }

  // delete the last character(s)
  del() {
    if (_labelNum != "" && _labelNum.length > 0) {
      _labelNum = _labelNum.substring(0, _labelNum.length - 1);
      notifyListeners();
    }
  }

  // button '=' show the result of any operation
  result() {
    // Select corrent operation
    if (_labelNum != "") {
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
}
