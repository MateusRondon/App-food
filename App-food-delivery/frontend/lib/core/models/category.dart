class Category{
  final int id;
  final int restaurantID;
  final String name;
  List<Product> products;
  category({
    required this.id,
    required this.restaurantID,
    required this.name,
     this.products = const [],
  });
  factory category.fromJson(Map<String, dynamic> json) {
    return category(
      id: json['id'],
      restaurantID: json['restaurant_id'],
      name: json['name'],
        products: (json['products'] as List?)
          ?.map((item) => Product.fromJson(item))
          .toList() ??
          [],
    );
  }
}