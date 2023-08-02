import 'package:flutter/material.dart';

class TextFieldProvider extends ChangeNotifier {
  String _textFieldValue = '';

  String get textFieldValue => _textFieldValue;

  void setTextFieldValue(String newValue) {
    _textFieldValue = newValue;
    notifyListeners();
  }
}
