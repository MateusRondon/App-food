class Food {
    final String name;       //nome do lanche
    final String description;   // Tipo de burgers
    final String imagePath;   // imagens de burgers
    final String imagemExtra;   // imagens de burgers
    final double price;  // preco
    final FoodCategory category;  // burger
    List<Addon> availableAddons;   //extra
    List<Tamanho> availableTamanho;   //extra
    List<String> sizes; //tamanho  Lista de intens de forma dinamica

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.imagemExtra,
    required this.price,
    required this.category,
    required this.availableAddons,
    required this.sizes,
    required this.availableTamanho,
  });
  
}
//categories
enum FoodCategory{
  lanches,
  mercado,
  farmacia,
}
class Addon{
  String name;
  double price;
  String imagemExtra;
   Addon({ 
    required this.name,
    required this.price,
    required this.imagemExtra,
    });
}
class Tamanho{
  
  String tm;
  double price;
  //String imagemExtra;
   Tamanho({ 
    required this.tm,
     required this.price,
    // required this.imagemExtra,
    });
}
class ComboHistory {
  final String foodName;
  final List<Addon> addons;
  final String tamanho;

  ComboHistory({
    required this.foodName,
    required this.addons,
    required this.tamanho,
  });
}