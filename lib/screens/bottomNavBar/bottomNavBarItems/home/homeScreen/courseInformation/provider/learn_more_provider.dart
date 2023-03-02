import 'package:flutter/cupertino.dart';

class LearnMoreProvider with ChangeNotifier {
  bool _showMore = true;
  bool get showMore => _showMore;
  showMoreShowLess() {
    _showMore = !showMore;
    notifyListeners();
  }
}
