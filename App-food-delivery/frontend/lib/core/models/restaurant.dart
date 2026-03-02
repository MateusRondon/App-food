class Restaurant {
  final int id;
  final String name;
  final String description;
  final String? imageUrl;
  final String category;
  final double rating;
  final String deliveryTime;
  final double deliveryFee;
  final String? address;
  final bool isOpen;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    this.imageUrl,
    required this.category,
    required this.rating,
    required this.deliveryTime,
    required this.deliveryFee,
    this.address,
    required this.isOpen,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? '',
      imageUrl: json['image_url'],
      category: json['category'],
      rating: (json['rating'] ?? 0).toDouble(),
      deliveryTime: json['delivery_time'] ?? '',
      deliveryFee: (json['delivery_fee'] ?? 0).toDouble(),
      address: json['address'],
      isOpen: json['is_open'] == 1 || json['is_open'] == true,
    );
  }
}