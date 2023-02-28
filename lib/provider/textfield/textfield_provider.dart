import 'package:flutter/material.dart';

class TextFieldProvider with ChangeNotifier {
  bool _obscureText = true;
  bool get obsureText => _obscureText;

  void changeObscureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }
}
