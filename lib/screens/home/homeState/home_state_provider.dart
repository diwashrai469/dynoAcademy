import 'package:flutter/material.dart';

class HomeStateProvider with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  getNavIndex(int index) {
    _currentIndex = index;

    notifyListeners();
  }
}
