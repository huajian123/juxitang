import 'package:flutter/material.dart' show ChangeNotifier;

// 左侧导航栏当前索引状态
class LeftNavIndexProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(index) {
    _currentIndex = index;
    notifyListeners();
  }
}
