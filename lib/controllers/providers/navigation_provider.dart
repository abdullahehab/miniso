import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniso/views/categories/categorie_page.dart';
import 'package:miniso/views/my_cart/cart_page.dart';
import 'package:miniso/views/search/search_page.dart';

import '../../views/categories/beauti_page.dart';
import '../../views/categories/care_page.dart';
import '../../views/categories/clothes_page.dart';
import '../../views/home/HomePage.dart';
import '../../views/profile/profile_page.dart';


class NavigationNotifier extends ChangeNotifier {
  int currentIndex = 0;

  List<Widget> screens =  [
    HomePage(),
    CategoriesPage(),
    CartPage(),
    ProfilePage(),
  ];

  void changeScreen(int val) {
    currentIndex = val;
    notifyListeners();
  }

  void clear() {
    currentIndex = 0;
    notifyListeners();
  }
  void resetIndex() {
    currentIndex = 0;
    notifyListeners();
  }
}

final navigationProvider = ChangeNotifierProvider<NavigationNotifier>(
      (ref) => NavigationNotifier(),
);
