class CartItem {
  final int id;
  final int productId;
  final String name;
  final String description;
  final double price;
  final String? imageUrl;
  final int quantity;

  CartItem({
    required this.id,
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    this.imageUrl,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      productId: json['product_id'],
      name: json['name'],
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      imageUrl: json['image_url'],
      quantity: json['quantity'] ?? 1,
    );
  }

  double get total => price * quantity;
}