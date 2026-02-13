import 'package:flutter/material.dart';
import '../models/food.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  final List<FoodCategory> foodCategories;

  const MyTabBar({
    super.key,
    required this.tabController,
    required this.foodCategories,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      isScrollable: true, // Permite rolar as abas se houver muitas
      tabs: [
          for (var food in foodCategories)
          Tab(text: food.toString().split('.').last),
      ],
      
    );
  }
}