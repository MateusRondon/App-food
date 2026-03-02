import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import '../models/category.dart';
import '../services/api_service.dart';

class RestaurantProvider with ChangeNotifier {
  final ApiService _api = ApiService();
  List<Restaurant> _restaurants = [];
  Restaurant? _selectedRestaurant;
  List<Category> _menu = [];
  bool _isLoading = false;
  String? _error;

  List<Restaurant> get restaurants => _restaurants;
  Restaurant? get selectedRestaurant => _selectedRestaurant;
  List<Category> get menu => _menu;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadRestaurants({String? category}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _api.loadToken();
      final data = await _api.getRestaurants(category: category);
      _restaurants = data.map((r) => Restaurant.fromJson(r)).toList();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadRestaurant(int id) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _api.loadToken();
      final data = await _api.getRestaurant(id);
      _selectedRestaurant = Restaurant.fromJson(data);
      
      final menuData = await _api.getRestaurantMenu(id);
      _menu = menuData.map((c) => Category.fromJson(c)).toList();
      
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchRestaurants(String query) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _api.loadToken();
      final data = await _api.searchRestaurants(query);
      _restaurants = data.map((r) => Restaurant.fromJson(r)).toList();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}