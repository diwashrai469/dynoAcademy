import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int _currentNavIndex = 0;
  int get currentNavIndex => _currentNavIndex;

  void changeNavIndex(int index) {
    _currentNavIndex = index;
    notifyListeners();
  }
}
