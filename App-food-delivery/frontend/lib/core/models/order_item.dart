class OrderItem {
  final int id;
  final int orderId;
  final int productId;
  final String name;
  final String? imageUrl;
  final int quantity;
  final double price;

  OrderItem({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.name,
    this.imageUrl,
    required this.quantity,
    required this.price,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      orderId: json['order_id'],
      productId: json['product_id'],
      name: json['name'],
      imageUrl: json['image_url'],
      quantity: json['quantity'],
      price: (json['price'] ?? 0).toDouble(),
    );
  }

  double get total => price * quantity;
}