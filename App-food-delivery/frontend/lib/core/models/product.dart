class Product {
  final int id;
  final int restaurantId;
  final int? categoryId;
  final String name;
  final String description;
  final double price;
  final String? imageUrl;
  final bool isAvailable;

  Product({
    required this.id,
    required this.restaurantId,
    this.categoryId,
    required this.name,
    required this.description,
    required this.price,
    this.imageUrl,
    required this.isAvailable,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      restaurantId: json['restaurant_id'],
      categoryId: json['category_id'],
      name: json['name'],
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      imageUrl: json['image_url'],
      isAvailable: json['is_available'] == 1 || json['is_available'] == true,
    );
  }
}