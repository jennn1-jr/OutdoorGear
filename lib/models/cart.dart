import 'package:login_app/models/camping_item.dart';

class CartItem {
  final CampingItem item;
  int quantity;

  CartItem({required this.item, this.quantity = 1});

  double get totalPrice => item.harga * quantity;
}
