import 'package:flutter/material.dart';
import 'package:ownkey_mobile_test/core/models/property.dart';

class LikeSate extends ChangeNotifier {
  final List<Property> _likedProperties = [];

  List<Property> get likedProperties => _likedProperties;

  void likeProperty(Property property) {
    if (!_likedProperties.contains(property)) {
      _likedProperties.add(property);
      notifyListeners();
    }
  }

  void unlikeProperty(Property property) {
    if (_likedProperties.contains(property)) {
      _likedProperties.remove(property);
      notifyListeners();
    }
  }

  bool isLiked(Property property) {
    return _likedProperties.contains(property);
  }

  // get liked properties
  Future<List<Property>> getLikedProperties() async {
    return _likedProperties;
  }
}
