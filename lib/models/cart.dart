import 'package:login_app/models/camping_item.dart';

class CartItem {
  final CampingItem item;
  int quantity;

  CartItem({required this.item, this.quantity = 1});

  double get totalPrice => item.harga * quantity;

  Map<String, dynamic> toJson() {
    return {
      'item': item.toJson(),
      'quantity': quantity,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      item: CampingItem.fromJson(json['item']),
      quantity: json['quantity'],
    );
  }
}
