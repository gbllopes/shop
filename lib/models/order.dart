import 'package:shop/models/cart_item.dart';

class Order {
  String? id;
  final double total;
  final List<CartItem> products;
  final DateTime date;

  Order({
    id,
    required this.total,
    required this.products,
    required this.date,
  });
}
