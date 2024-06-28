// colors
import 'package:flutter/material.dart';
import 'package:ownkey_mobile_test/features/favorites/favorites.dart';
import 'package:ownkey_mobile_test/features/home/home.dart';

Color priCol = const Color(0xff022e72);

Color secCol = const Color(0xffd62251);

Color terCol = const Color(0xffFFECB3);

Color accCol = const Color(0xffebf5ff);

Color bgCol = const Color(0xffF5F5F5);

Color txtCol = const Color(0xff212121);

final kMainPages = [
  const HomePage(),
  Container(
    child: const Center(child: Text("Favorites")),
  ),
  FavoritesPage(),
  Container(
    child: const Center(child: Text("Account")),
  ),
];
