import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_current_location.dart';
import '../components/my_description_box.dart';
import '../components/my_drawer.dart';
import '../components/my_food_tile.dart';
// import '../components/my_market_tile.dart';
import '../components/my_sliver_app_bar.dart';
import '../components/my_tab_bar.dart';
import '../models/restaurant.dart';
import '../models/food.dart';
import '../Pages/food_page.dart';
// import '../Pages/mercado_page.dart'; // Página específica para mercados

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // O número de abas depende das categorias de alimentos e mercados
    _tabController = TabController(
      length: FoodCategory.values.length, // 1 para a aba de alimentos, 1 para a aba de mercados
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Filtra alimentos por categoria
  List<Food> _filterMenuCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return FoodTile(
            food: food,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodPage(food: food),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(
              //categMercado: Categ.values,
              tabController: _tabController,
              foodCategories: FoodCategory.values,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                MyCurrentLocation(),
                const MyDescrptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
            controller: _tabController,
            children: [
              // Páginas de alimentos
              ...getFoodInThisCategory(restaurant.menu),
            ],
          ),
        ),
      ),
    );
  }
}
