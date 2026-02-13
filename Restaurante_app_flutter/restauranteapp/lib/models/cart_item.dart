import '../models/food.dart';

//Sistema de 
class CartItem{
  final Food food;
  List <Addon> selectedAddons;
  List <Tamanho> selectedTamanho;
  int quantity;
  CartItem({
    required this.food,
    required this.selectedAddons,
    required this.selectedTamanho,
    this.quantity = 1,
  });
  double get totalPrice{
    double addonsPrice = selectedAddons.fold(0,
    (sum,addon)=> sum + addon.price);
    return (food.price + addonsPrice) * quantity;
    
  }
    CartItem._(this.food, 
    this.selectedAddons, 
    this.selectedTamanho,
    this.quantity
    );

  // selectedTamanho => null; // Construtor privado

  static CartItem create(Food food, List<Addon> selectedAddons,List<Tamanho>selectedTamanho) {
    return CartItem._(food, selectedAddons,selectedTamanho, 1);
  }

}

 

