import 'dart:io';

import 'package:XFoody/models/ingredient.dart';
import 'package:flutter/material.dart';

import '../models/plat.dart';

class Favourites with ChangeNotifier {
  List<Plat> _items = [];

  List<Plat> get items {
    return [..._items];
  }

  void addItem({id}) {
    final plat = findById(id);

    if (!_items.contains(plat)) {
      _items.add(plat!);
    }
    notifyListeners();
  }

  Plat? findById(String produitID) {
    return dummyPlat.firstWhere((element) => element.id == produitID);
  }

  void deleteById(String productId) async {
    _items.removeWhere((element) => element.id == productId);
    notifyListeners();
  }
}
