class Order {
  final int id;
  final int userId;
  final int restaurantId;
  final String restaurantName;
  final String? restaurantImage;
  final double total;
  final double deliveryFee;
  final String status;
  final String paymentMethod;
  final String deliveryAddress;
  final String createdAt;
  final List<OrderItem>? items;

  Order({
    required this.id,
    required this.userId,
    required this.restaurantId,
    required this.restaurantName,
    this.restaurantImage,
    required this.total,
    required this.deliveryFee,
    required this.status,
    required this.paymentMethod,
    required this.deliveryAddress,
    required this.createdAt,
    this.items,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json['user_id'],
      restaurantId: json['restaurant_id'],
      restaurantName: json['restaurant_name'] ?? '',
      restaurantImage: json['restaurant_image'],
      total: (json['total'] ?? 0).toDouble(),
      deliveryFee: (json['delivery_fee'] ?? 0).toDouble(),
      status: json['status'],
      paymentMethod: json['payment_method'] ?? '',
      deliveryAddress: json['delivery_address'] ?? '',
      createdAt: json['created_at'] ?? '',
      items: (json['items'] as List?)?.map((i) => OrderItem.fromJson(i)).toList(),
    );
  }

  String get statusText {
    switch (status) {
      case 'pending':
        return 'Pendente';
      case 'confirmed':
        return 'Confirmado';
      case 'preparing':
        return 'Preparando';
      case 'on_delivery':
        return 'Saiu para entrega';
      case 'delivered':
        return 'Entregue';
      case 'cancelled':
        return 'Cancelado';
      default:
        return status;
    }
  }
}