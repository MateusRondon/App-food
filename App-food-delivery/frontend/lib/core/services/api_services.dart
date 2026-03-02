import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:3000/api/v1';
  String? _token;

  Future<void> setToken(String token) async {
    _token = token;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
  }

  Future<void> clearToken() async {
    _token = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  Map<String, String> _headers({bool needsAuth = false}) {
    final headers = {
      'Content-Type': 'application/json',
    };
    if (needsAuth && _token != null) {
      headers['Authorization'] = 'Bearer $_token';
    }
    return headers;
  }

  Future<Map<String, dynamic>> _handleResponse(http.Response response) async {
    final data = json.decode(response.body);
    
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    } else {
      throw Exception(data['message'] ?? 'Erro na requisição');
    }
  }

  // Auth
  Future<Map<String, dynamic>> register(Map<String, dynamic> userData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: _headers(),
      body: json.encode(userData),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: _headers(),
      body: json.encode({'email': email, 'password': password}),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getCurrentUser() async {
    final response = await http.get(
      Uri.parse('$baseUrl/auth/me'),
      headers: _headers(needsAuth: true),
    );
    return _handleResponse(response);
  }

  // Restaurants
  Future<List<dynamic>> getRestaurants({String? category}) async {
    String url = '$baseUrl/restaurants';
    if (category != null) {
      url += '?category=$category';
    }
    final response = await http.get(Uri.parse(url), headers: _headers());
    final data = await _handleResponse(response);
    return data['data'];
  }

  Future<Map<String, dynamic>> getRestaurant(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/restaurants/$id'),
      headers: _headers(),
    );
    final data = await _handleResponse(response);
    return data['data'];
  }

  Future<List<dynamic>> getRestaurantMenu(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/restaurants/$id/menu'),
      headers: _headers(),
    );
    final data = await _handleResponse(response);
    return data['data'];
  }

  Future<List<dynamic>> searchRestaurants(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl/restaurants/search?q=$query'),
      headers: _headers(),
    );
    final data = await _handleResponse(response);
    return data['data'];
  }

  // Cart
  Future<Map<String, dynamic>> getCart() async {
    final response = await http.get(
      Uri.parse('$baseUrl/cart'),
      headers: _headers(needsAuth: true),
    );
    final data = await _handleResponse(response);
    return data['data'];
  }

  Future<Map<String, dynamic>> addToCart(int productId, int quantity) async {
    final response = await http.post(
      Uri.parse('$baseUrl/cart/items'),
      headers: _headers(needsAuth: true),
      body: json.encode({'productId': productId, 'quantity': quantity}),
    );
    final data = await _handleResponse(response);
    return data['data'];
  }

  Future<Map<String, dynamic>> updateCartItem(int itemId, int quantity) async {
    final response = await http.put(
      Uri.parse('$baseUrl/cart/items/$itemId'),
      headers: _headers(needsAuth: true),
      body: json.encode({'quantity': quantity}),
    );
    final data = await _handleResponse(response);
    return data['data'];
  }

  Future<Map<String, dynamic>> removeFromCart(int itemId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/cart/items/$itemId'),
      headers: _headers(needsAuth: true),
    );
    final data = await _handleResponse(response);
    return data['data'];
  }

  Future<Map<String, dynamic>> clearCart() async {
    final response = await http.delete(
      Uri.parse('$baseUrl/cart'),
      headers: _headers(needsAuth: true),
    );
    final data = await _handleResponse(response);
    return data['data'];
  }

  // Orders
  Future<Map<String, dynamic>> createOrder(Map<String, dynamic> orderData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/orders'),
      headers: _headers(needsAuth: true),
      body: json.encode(orderData),
    );
    final data = await _handleResponse(response);
    return data['data'];
  }

  Future<List<dynamic>> getOrders() async {
    final response = await http.get(
      Uri.parse('$baseUrl/orders'),
      headers: _headers(needsAuth: true),
    );
    final data = await _handleResponse(response);
    return data['data'];
  }

  Future<Map<String, dynamic>> getOrder(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/orders/$id'),
      headers: _headers(needsAuth: true),
    );
    final data = await _handleResponse(response);
    return data['data'];
  }

  Future<Map<String, dynamic>> cancelOrder(int id) async {
    final response = await http.post(
      Uri.parse('$baseUrl/orders/$id/cancel'),
      headers: _headers(needsAuth: true),
    );
    final data = await _handleResponse(response);
    return data['data'];
  }
}