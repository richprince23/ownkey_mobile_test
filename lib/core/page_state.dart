import 'package:flutter/material.dart';

class PageState extends ChangeNotifier {
  int _currentPage = 0;

// this getter will be used to get the current page
  int get currentPage => _currentPage;

// this method will be called from the page view to set the current page
  void setPage(int index) {
    _currentPage = index;
    notifyListeners();
  }
}
