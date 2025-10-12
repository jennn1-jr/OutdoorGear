import 'package:flutter/material.dart';
import 'package:login_app/models/cart.dart';
import 'package:login_app/models/camping_item.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalHarga {
    return _items.fold(0, (sum, item) => sum + item.totalPrice);
  }

  void tambahItem(CampingItem item) {
    final index = _items.indexWhere((cartItem) => cartItem.item.id == item.id);
    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(item: item));
    }
    notifyListeners();
  }

  void kurangiItem(CampingItem item) {
    final index = _items.indexWhere((cartItem) => cartItem.item.id == item.id);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  void hapusItem(CampingItem item) {
    _items.removeWhere((cartItem) => cartItem.item.id == item.id);
    notifyListeners();
  }

  void kosongkanCart() {
    _items.clear();
    notifyListeners();
  }
}
