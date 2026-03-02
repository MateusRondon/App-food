import 'package:flutter/material.dart';
import '../models/order.dart';
import '../services/api_service.dart';

class OrderProvider with ChangeNotifier {
  final ApiService _api = ApiService();
  List<Order> _orders = [];
  Order? _currentOrder;
  bool _isLoading = false;

  List<Order> get orders => _orders;
  Order? get currentOrder => _currentOrder;
  bool get isLoading => _isLoading;

  Future<void> loadOrders() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _api.loadToken();
      final data = await _api.getOrders();
      _orders = data.map((o) => Order.fromJson(o)).toList();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<Order?> createOrder(Map<String, dynamic> orderData) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _api.loadToken();
      final data = await _api.createOrder(orderData);
      _currentOrder = Order.fromJson(data);
      _isLoading = false;
      notifyListeners();
      return _currentOrder;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return null;
    }
  }

  Future<void> loadOrder(int id) async {
    try {
      await _api.loadToken();
      final data = await _api.getOrder(id);
      _currentOrder = Order.fromJson(data);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
