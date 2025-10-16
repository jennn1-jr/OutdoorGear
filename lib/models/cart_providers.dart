import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:login_app/models/cart.dart';
import 'package:login_app/models/camping_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalHarga => _items.fold(0, (sum, item) => sum + item.totalPrice);

  CartProvider() {
    _loadCartFromPrefs(); // ✅ otomatis load cart saat provider dibuat
  }

  Future<void> tambahItem(CampingItem item, [int quantity = 1]) async {
    final index = _items.indexWhere((cartItem) => cartItem.item.id == item.id);

    if (index >= 0) {
      _items[index].quantity += quantity;
    } else {
      _items.add(CartItem(item: item, quantity: quantity));
    }

    notifyListeners();
    await _saveCartToPrefs(); // ✅ simpan ke prefs setiap perubahan
  }

  Future<void> kurangiItem(CampingItem item) async {
    final index = _items.indexWhere((cartItem) => cartItem.item.id == item.id);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
      await _saveCartToPrefs();
    }
  }

  Future<void> hapusItem(CampingItem item) async {
    _items.removeWhere((cartItem) => cartItem.item.id == item.id);
    notifyListeners();
    await _saveCartToPrefs();
  }

  Future<void> kosongkanCart() async {
    _items.clear();
    notifyListeners();
    await _saveCartToPrefs();
  }

  /// =============================
  /// 🔹 SIMPAN KE SHARED PREFERENCES
  /// =============================
  Future<void> _saveCartToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = jsonEncode(_items.map((e) => e.toJson()).toList());
    await prefs.setString('cart_data', cartJson);
  }

  /// =============================
  /// 🔹 LOAD DARI SHARED PREFERENCES
  /// =============================
  Future<void> _loadCartFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final cartString = prefs.getString('cart_data');
    if (cartString != null) {
      final decoded = jsonDecode(cartString) as List<dynamic>;
      _items = decoded.map((e) => CartItem.fromJson(e)).toList();
      notifyListeners();
    }
  }
}
