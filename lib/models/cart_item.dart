class CartItem {
  final String id;
  final String productId;
  final String title;
  int quantity;
  final double price;
  final String urlImage;

  CartItem(
      {required this.id,
      required this.productId,
      required this.title,
      this.quantity = 1,
      required this.price,
      required this.urlImage});
}
