import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/restaurant.dart';
import '../services/api_service.dart';

class CartProvider with ChangeNotifier {
  final ApiService _api = ApiService();
  List<CartItem> _items = [];
  Restaurant? _restaurant;
  double _total = 0;
  bool _isLoading = false;

  List<CartItem> get items => _items;
  Restaurant? get restaurant => _restaurant;
  double get total => _total;
  double get deliveryFee => _restaurant?.deliveryFee ?? 0;
  double get grandTotal => _total + deliveryFee;
  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);
  bool get isLoading => _isLoading;

  Future<void> loadCart() async {
    try {
      await _api.loadToken();
      final data = await _api.getCart();
      _items = (data['items'] as List).map((i) => CartItem.fromJson(i)).toList();
      _total = (data['total'] ?? 0).toDouble();
      if (data['restaurant'] != null) {
        _restaurant = Restaurant.fromJson(data['restaurant']);
      }
      notifyListeners();
    } catch (e) {
      // Ignore if not logged in
    }
  }

  Future<void> addItem(int productId, {int quantity = 1}) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _api.loadToken();
      final data = await _api.addToCart(productId, quantity);
      _items = (data['items'] as List).map((i) => CartItem.fromJson(i)).toList();
      _total = (data['total'] ?? 0).toDouble();
      if (data['restaurant'] != null) {
        _restaurant = Restaurant.fromJson(data['restaurant']);
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> updateQuantity(int itemId, int quantity) async {
    try {
      await _api.loadToken();
      final data = await _api.updateCartItem(itemId, quantity);
      _items = (data['items'] as List).map((i) => CartItem.fromJson(i)).toList();
      _total = (data['total'] ?? 0).toDouble();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeItem(int itemId) async {
    try {
      await _api.loadToken();
      final data = await _api.removeFromCart(itemId);
      _items = (data['items'] as List).map((i) => CartItem.fromJson(i)).toList();
      _total = (data['total'] ?? 0).toDouble();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> clearCart() async {
    try {
      await _api.loadToken();
      await _api.clearCart();
      _items = [];
      _restaurant = null;
      _total = 0;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
