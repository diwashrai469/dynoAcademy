import 'package:flutter/material.dart';

class LearnMoreProvider with ChangeNotifier {
  bool _showMore = true;
  bool get showMore => _showMore;
  void showDetails() {
    _showMore = !_showMore;
    notifyListeners();
  }
}
