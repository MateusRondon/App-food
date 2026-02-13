// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:intl/intl.dart';

import '../models/cart_item.dart';
import 'food.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';


class Restaurant extends ChangeNotifier{
  // menu
  // 

  /* Enum Mercado */
 final  List<Food>_menu = [

  // burgers
   Food(name: ' Ford',
  description: " Mercado Atacadista ", 
  imagemExtra: " ",
  imagePath: "lib/imagens/mercados/imagemMercado.jpg",
  price: 4.0,
  category: FoodCategory.mercado,
  availableAddons: [
    Addon(name: "Detergente",price: 2.99,imagemExtra: "lib/imagens/mercados/Detergente.jpg"),
    Addon(name: " Sabao",price: 9.99,imagemExtra: "lib/imagens/mercados/sabao.jpg"),
    Addon(name: " Agua Sanitaria",price: 10.99,imagemExtra: "lib/imagens/mercados/Qboa.jpg"),
    ],
    availableTamanho:[
       Tamanho(tm:" Frete _ Demorado ",price: 2.00), 
       Tamanho(tm:" Frete _ Medio",price: 3.99),
       Tamanho(tm:" Frete _ Urgente ",price: 5.99),
       
    ],
    sizes: ["Pequeno", "Médio", "Grande"], 
  ),
   Food(name: ' Comper',
  description: " Mercado Popular ", 
  imagemExtra: "lib/imagens/mercados/Detergente.jpg",
  imagePath: "lib/imagens/mercados/imagem_mercado02.jpg",
  price: 5.00,
  category: FoodCategory.mercado,
  availableAddons: [
    Addon(name: "Detergente",price: 3.99,imagemExtra: "lib/imagens/mercados/Detergente.jpg"),
    Addon(name: " Sabao",price: 10.00,imagemExtra: "lib/imagens/mercados/sabao.jpg"),
    Addon(name: " Agua Sanitaria",price: 11.00,imagemExtra: "lib/imagens/mercados/Qboa.jpg"),
    ],
    availableTamanho:[
      Tamanho(tm:" Frete _ Demorado ",price: 2.00),
      Tamanho(tm:" Frete _ Medio",price: 3.99),
      Tamanho(tm:" Frete _ Urgente ",price: 5.99), 
       
    ],
    sizes: ["Demorado", "Medio", "Urgente"], // tempo estimado
  ),


/*Enum farmacia */

Food(name: ' Farmacia ',
  description: " Qualidade do preco é aqui ", 
  imagemExtra: " ",
  imagePath: "lib/imagens/farmacia/imagem_farmacia.jpg",
  price: 5,// Preco de referencia
  category: FoodCategory.farmacia,
  availableAddons: [
    Addon(name: "Paracetamol",price: 2.99,imagemExtra: "lib/imagens/farmacia/remedio_paracetamol.jpg"),
    Addon(name: "Doralgina",price: 9.99,imagemExtra: "lib/imagens/farmacia/remedio_doralgina.jpg"),
    Addon(name: "Resfenol",price: 10.99,imagemExtra: "lib/imagens/farmacia/remedio_resfenol.jpg"),
    ],
    availableTamanho:[
       Tamanho(tm:" Frete _ Demorado ",price: 2.00), 
       Tamanho(tm:" Frete _ Medio",price: 3.99),
       Tamanho(tm:" Frete _ Urgente ",price: 5.99),
       
    ],
    sizes: ["Demorado", "Medio", "Urgente"], 
  ),


/*
Enum lanches
  */
  //1 Opcao
  Food(name: 'Modao  Da Casa',
  description: "Classico cheddar, tomate,cebola,alface, carne moda tipica e alguns acompanhamentos extras", 
  imagePath: "lib/imagens/burgers/Burgers.png",
  imagemExtra: "lib/imagens/burgers/Burgers.png",
  price: 2.0,
  category: FoodCategory.lanches,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00,imagemExtra: "lib/imagens/burgers/Burgers.png"),
    Addon(name: "Bacon",price: 6.00,imagemExtra: "lib/imagens/burgers/Burgers.png"),
    Addon(name: "Salada",price: 1.00,imagemExtra: "lib/imagens/burgers/Burgers.png"),
    ],
    availableTamanho:[
       Tamanho(tm:"Pequeno",price: 2.99), // Opções de tamanho
       //falta a imagem da comida
       // e o historico de pedido
       Tamanho(tm:"Médio",price: 3.99), // Opções de tamanho
       Tamanho(tm:"Grande",price: 5.99), // Opções de tamanho
    ],
    sizes: ["Pequeno", "Médio", "Grande"], // Opções de tamanho
  ),
  //2 Opcao
  Food(name: "Classico Cheeseburger",
  description: "Classico cheddar, tomate, carne moda tipica e alguns acompanhamentos extras", 
  imagePath: "lib/imagens/burgers/Burgers1.png",
  imagemExtra: "lib/imagens/burgers/Burgers1.png",
  price: 2.5,
  category: FoodCategory.lanches,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00,imagemExtra: "lib/imagens/burgers/Burgers1.png"),
    Addon(name: "Bacon",price: 6.00,imagemExtra: "lib/imagens/burgers/Burgers1.png"),
    Addon(name: "Salada",price: 1.00,imagemExtra: "lib/imagens/burgers/Burgers1.png"),
    ],
    availableTamanho:[
       Tamanho(tm:"Pequeno",price: 2.99,), // Opções de tamanho
       Tamanho(tm:"Médio",price: 3.99), // Opções de tamanho
       Tamanho(tm:"Grande",price: 5.99), // Opções de tamanho
    ],
    
    sizes: ["Pequeno", "Médio", "Grande"], // Opções de tamanho
  ),
 //3 Opcao
  Food(name: "Duplo  Burgers",
  description: " Duplo Hamburguer, Com cebola,alface,tomate,cheddar, e outros acompanhamentos", 
  imagePath: "lib/imagens/burgers/DuploBurgers.jpg",
    imagemExtra: "lib/imagens/burgers/DuploBurgers.jpg",
  price: 3.0,
  category: FoodCategory.lanches,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00,imagemExtra: "lib/imagens/burgers/DuploBurgers.jpg"),
    Addon(name: "Bacon",price: 6.00,imagemExtra: "lib/imagens/burgers/DuploBurgers.jpg"),
    Addon(name: "Salada",price: 1.00,imagemExtra: "lib/imagens/burgers/DuploBurgers.jpg"),
    ],
    availableTamanho:[
       Tamanho(tm:"Pequeno",price: 2.99), // Opções de tamanho
       Tamanho(tm:"Médio",price: 3.99), // Opções de tamanho
       Tamanho(tm:"Grande",price: 5.99), // Opções de tamanho
    ],
    sizes: ["Pequeno", "Médio", "Grande"], // Opções de tamanho
  ),
 //4 Opcao
  Food(name: "Triplo Burgers",
  description: "Triplo Hamburguer, com saladas e um adicional  Bacon e catupiry", 
  imagePath: "lib/imagens/burgers/TriploBurges.jpg",
  imagemExtra: "lib/imagens/burgers/TriploBurges.jpg",
  price: 5.00,
  category: FoodCategory.lanches,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00,imagemExtra: "lib/imagens/burgers/TriploBurges.jpg"),
    Addon(name: "Bacon",price: 6.00,imagemExtra: "lib/imagens/burgers/TriploBurges.jpg"),
    Addon(name: "Salada",price: 1.00,imagemExtra: "lib/imagens/burgers/TriploBurges.jpg"),
    ],
  availableTamanho:[
       Tamanho(tm:"Pequeno",price: 2.99), // Opções de tamanho
       Tamanho(tm:"Médio",price: 3.99), // Opções de tamanho
       Tamanho(tm:"Grande",price: 5.99), // Opções de tamanho
    ],
    sizes: ["Pequeno", "Médio", "Grande"], // Opções de tamanho
  ),
  //5 Opcao
  Food(name: "Bacon Burgers",
  description: "Com muito Bacon E sem salada,muito delicioso", 
  imagePath: "lib/imagens/burgers/BaconBurger.jpg",
  imagemExtra: "lib/imagens/burgers/BaconBurger.jpg",
  price: 4.00,
  category: FoodCategory.lanches,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00,imagemExtra: "lib/imagens/burgers/BaconBurger.jpg"),
    Addon(name: "Bacon",price: 6.00,imagemExtra: "lib/imagens/burgers/BaconBurger.jpg"),
    Addon(name: "Salada",price: 1.00,imagemExtra: "lib/imagens/burgers/BaconBurger.jpg"),
    ],
    availableTamanho:[
       Tamanho(tm:"Pequeno",price: 2.99), // Opções de tamanho
       Tamanho(tm:"Médio",price: 3.99), // Opções de tamanho
       Tamanho(tm:"Grande",price: 5.99), // Opções de tamanho
       
    ],
    sizes: ["Pequeno", "Médio", "Grande"], // Opções de tamanho
  ),

  //Espetos
  // Mercado(nome: "Saladas",
  // descrisao: "Tipo de Saladas , tomate, carne moda tipica e alguns acompanhamentos extras", 
  // imagemMercado: "a",
  // bebidas: "a",
  // preco: 20.99,
  // categorias: "a",
  // doces: " a",
  // feira: "a",
  // higiene: "a",
  // limpeza: "a",
  // qtd: 1.1,
  // localizacao: "a",
  // slogan: "a",
  // cupom: "a",
  // oferta: "a",
  // carnes: "a",
  // mercadoAddon: [
  //   Qtd(nome: "extra Cheese",preco: 5.00),
  //   Qtd(nome: "Bacon",preco: 6.00),
  //   Qtd(nome: "Salada",preco: 1.00),
  //   ],
  // ),
  /*
  Food(name: "Saladas",
  description: "Tipo de Saladas , tomate, carne moda tipica e alguns acompanhamentos extras", 
  imagePath: "a",
  price: 20.99,
  category: FoodCategory.salads,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00),
    Addon(name: "Bacon",price: 6.00),
    Addon(name: "Salada",price: 1.00),
    ],
  ),
  Food(name: "Saladas",
  description: "Tipo de Saladas , tomate, carne moda tipica e alguns acompanhamentos extras", 
  imagePath: "a",
  price: 20.99,
  category: FoodCategory.salads,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00),
    Addon(name: "Bacon",price: 6.00),
    Addon(name: "Salada",price: 1.00),
    ],
  ),
  Food(name: "Saladas",
  description: "Tipo de Saladas , tomate, carne moda tipica e alguns acompanhamentos extras", 
  imagePath: "a",
  price: 20.99,
  category: FoodCategory.salads,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00),
    Addon(name: "Bacon",price: 6.00),
    Addon(name: "Salada",price: 1.00),
    ],
  ),
  Food(name: "Saladas",
  description: "Tipo de Saladas , tomate, carne moda tipica e alguns acompanhamentos extras", 
  imagePath: "a",
  price: 20.99,
  category: FoodCategory.salads,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00),
    Addon(name: "Bacon",price: 6.00),
    Addon(name: "Salada",price: 1.00),
    ],
  ),

  //Massa
  Food(name: "Comidas",
  description: "Tipo de Comidaas , tomate, carne moda tipica e alguns acompanhamentos extras", 
  imagePath: "a",
  price: 20.99,
  category: FoodCategory.sides,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00),
    Addon(name: "Bacon",price: 6.00),
    Addon(name: "Salada",price: 1.00),
    ],
  ),
  Food(name: "Comidas",
  description: "Tipo de Comidaas , tomate, carne moda tipica e alguns acompanhamentos extras", 
  imagePath: "a",
  price: 20.99,
  category: FoodCategory.sides,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00),
    Addon(name: "Bacon",price: 6.00),
    Addon(name: "Salada",price: 1.00),
    ],
  ),  
  Food(name: "Comidas",
  description: "Tipo de Comidaas , tomate, carne moda tipica e alguns acompanhamentos extras", 
  imagePath: "a",
  price: 20.99,
  category: FoodCategory.sides,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00),
    Addon(name: "Bacon",price: 6.00),
    Addon(name: "Salada",price: 1.00),
    ],
  ),
  Food(name: "Comidas",
  description: "Tipo de Comidaas , tomate, carne moda tipica e alguns acompanhamentos extras", 
  imagePath: "a",
  price: 20.99,
  category: FoodCategory.sides,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00),
    Addon(name: "Bacon",price: 6.00),
    Addon(name: "Salada",price: 1.00),
    ],
  ),
  Food(name: "Comidas",
  description: "Tipo de Comidaas , tomate, carne moda tipica e alguns acompanhamentos extras", 
  imagePath: "a",
  price: 20.99,
  category: FoodCategory.sides,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00),
    Addon(name: "Bacon",price: 6.00),
    Addon(name: "Salada",price: 1.00),
    ],
  ),


    // Sobremesas
  Food(name: "Sobremesas",
  description: "Tipo de Sobremesas e acompanhamentos extras", 
  imagePath: "a",
  price: 20.99,
  category: FoodCategory.desserts,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00),
    Addon(name: "Bacon",price: 6.00),
    Addon(name: "Salada",price: 1.00),
    ],
  ),
  Food(name: "Sobremesas",
  description: "Tipo de Sobremesas e acompanhamentos extras", 
  imagePath: "a",
  price: 20.99,
  category: FoodCategory.desserts,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00),
    Addon(name: "Bacon",price: 6.00),
    Addon(name: "Salada",price: 1.00),
    ],
  ),
  Food(name: "Sobremesas",
  description: "Tipo de Sobremesas e acompanhamentos extras", 
  imagePath: "a",
  price: 20.99,
  category: FoodCategory.desserts,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00),
    Addon(name: "Bacon",price: 6.00),
    Addon(name: "Salada",price: 1.00),
    ],
  ),
  Food(name: "Sobremesas",
  description: "Tipo de Sobremesas e acompanhamentos extras", 
  imagePath: "a",
  price: 20.99,
  category: FoodCategory.desserts,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00),
    Addon(name: "Bacon",price: 6.00),
    Addon(name: "Salada",price: 1.00),
    ],
  ),
  Food(name: "Sobremesas",
  description: "Tipo de Sobremesas e acompanhamentos extras", 
  imagePath: "a",
  price: 20.99,
  category: FoodCategory.desserts,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00),
    Addon(name: "Bacon",price: 6.00),
    Addon(name: "Salada",price: 1.00),
    ],
  ),

  //Bebidas
  Food(name: "Bebidas",
  description: "Tipo de Bebidas e acompanhamentos extras", 
  imagePath: "a",
  price: 20.99,
  category: FoodCategory.drinks,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00),
    Addon(name: "Bacon",price: 6.00),
    Addon(name: "Salada",price: 1.00),
    ],
  ),
  Food(name: "Bebidas",
  description: "Tipo de Bebidas e acompanhamentos extras", 
  imagePath: "a",
  price: 20.99,
  category: FoodCategory.drinks,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00),
    Addon(name: "Bacon",price: 6.00),
    Addon(name: "Salada",price: 1.00),
    ],
  ),
  Food(name: "Bebidas",
  description: "Tipo de Bebidas e acompanhamentos extras", 
  imagePath: "a",
  price: 20.99,
  category: FoodCategory.drinks,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00),
    Addon(name: "Bacon",price: 6.00),
    Addon(name: "Salada",price: 1.00),
    ],
  ),
  Food(name: "Bebidas",
  description: "Tipo de Bebidas e acompanhamentos extras", 
  imagePath: "a",
  price: 20.99,
  category: FoodCategory.drinks,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00),
    Addon(name: "Bacon",price: 6.00),
    Addon(name: "Salada",price: 1.00),
    ],
  ),
  Food(name: "Bebidas",
  description: "Tipo de Bebidas e acompanhamentos extras", 
  imagePath: "a",
  price: 20.99,
  category: FoodCategory.drinks,
  availableAddons: [
    Addon(name: "extra Cheese",price: 5.00),
    Addon(name: "Bacon",price: 6.00),
    Addon(name: "Salada",price: 1.00),
    ],
  ),
  */
 ];
  final List<CartItem> _cart = [];
 

  String _deliveryAddress = 'Cuiaba';



  List<Food> get menu=> _menu; // lanche menu
  

  List<CartItem> get cart => _cart;

  String get deliverylocalization => _deliveryAddress;
  
  void addToCart(Food food, List<Addon> selectedAddons, List<Tamanho> selectedTamanho) {
  CartItem? cartItem = _cart.firstWhereOrNull((item) {
    bool isSameFood = item.food == food;
    bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);
    return isSameFood && isSameAddons;
  });

  if (cartItem != null) {
    cartItem.quantity++;
  } else {
    _cart.add(CartItem(
      food: food,
      selectedAddons: selectedAddons,
      selectedTamanho: selectedTamanho,
      quantity: 1,
    ));
  }

  // Adicionar o combo ao histórico
  addToComboHistory(food, selectedAddons, selectedTamanho);

  notifyListeners();
}
  
  List<Addon> selectedAddons(List<Addon> selectedAddons) => selectedAddons;
  List<Tamanho> selectedTamanho(List<Tamanho> selectedTamanho) => selectedTamanho;
  final List<ComboHistory> _comboHistory = [];

  
  List<ComboHistory> get comboHistory => _comboHistory;

    Type get food => Food;
    
    // remover o Cart
    void removeCart(CartItem cartItem){
      int cartIndex = _cart.indexOf(cartItem);
      if(cartIndex != -1 ){
          if(_cart[cartIndex].quantity>1){
            _cart[cartIndex].quantity--;
          }else {
            _cart.removeAt(cartIndex);
          }
      }
      notifyListeners();
    }

    // buscar o preco total do cart
  double getTotalPrice() {
  double total = 0.0;
  for (CartItem cartItem in _cart) {
    double itemTotal = cartItem.food.price;
    for (Addon addon in cartItem.selectedAddons) {
      itemTotal += addon.price;
    }
    for (Tamanho tamanho in cartItem.selectedTamanho) {
      itemTotal += tamanho.price;
    }
    total += itemTotal * cartItem.quantity; 
  }
  return total;
}
    // buscar o numero de intens  no cart
    int getTotalItemCount(){
      int totalItemCount= 0;
      for(CartItem cartItem in _cart){
        totalItemCount +=cartItem.quantity;
      }
      return totalItemCount;
    }
    void clearCart(){
      _cart.clear();
      notifyListeners();
    }
void updateDeliveryAddress(String newAddress){
  _deliveryAddress = newAddress;
  notifyListeners();
}
    //----------------------------------------------------//
    //Gerar Recibo
    String displayCartRecibo(){
      final receipt =StringBuffer();
      receipt.writeln("Seu Recibo");
      receipt.writeln();
      String formattedDate = DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now ());
        receipt.writeln(formattedDate);
          receipt.writeln();
            receipt.writeln("-------------------");
            //Descrisao do produto que foi pedido
        for(final cartItem in _cart){
            receipt.writeln("${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
            if(cartItem.selectedAddons.isNotEmpty ){
                receipt.writeln("Adicionais -  ${_formatAddons(cartItem.selectedAddons)}");
                receipt.writeln("Tamanho -  ${_formatTamanho(cartItem.selectedTamanho)}");
            }
          receipt.writeln();
        }
          receipt.writeln("-------------------");
            receipt.writeln();
              receipt.writeln("Total de Itens:  ${getTotalItemCount()}");
                receipt.writeln("Total do Preco:  ${_formatPrice(getTotalPrice())}");
        return   receipt.toString();
    }
    //formato de preco
    String _formatPrice(double price){
      return "${price.toStringAsFixed(2)}"; 
    }
    // formato Addon
    String _formatAddons(List<Addon>addons){
      return addons.map((addon)=>"${addon.name} (${_formatPrice(addon.price)})")
      .join(",");  
    }
    //formato do Tamanho do pedido
    String _formatTamanho(List<Tamanho>tamanho){
      return tamanho.map((tamanho)=>"${tamanho.tm} (${_formatPrice(tamanho.price)})")
      .join(",");  
    }

  // Atualizar o histórico com as seleções
  
  void addToComboHistory(Food food, List<Addon> selectedAddons, List<Tamanho> selectedTamanho) {
    _comboHistory.add(ComboHistory(
      foodName: food.name,
      addons: selectedAddons,
      tamanho: selectedTamanho.isNotEmpty ? selectedTamanho.first.tm : 'N/A',
    ));
    notifyListeners();
  }
   void clearComboHistory() {
    _comboHistory.clear();
    notifyListeners();
  }
   String comboHistorico(){
      final receipt =StringBuffer();
      receipt.writeln("Seu Recibo");
      receipt.writeln();
      String formattedDate = DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now ());
        receipt.writeln(formattedDate);
          receipt.writeln();
            receipt.writeln("-------------------");
            //Descrisao do produto que foi pedido
        for(final cartItem in _cart){
            receipt.writeln("${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
            if(cartItem.selectedAddons.isNotEmpty ){
                receipt.writeln("Adicionais -  ${_formatAddons(cartItem.selectedAddons)}");
                receipt.writeln("Tamanho -  ${_formatTamanho(cartItem.selectedTamanho)}");
            }
          receipt.writeln();
        }
          receipt.writeln("-------------------");
            receipt.writeln();
              receipt.writeln("Total de Itens:  ${getTotalItemCount()}");
                receipt.writeln("Total do Preco:  ${_formatPrice(getTotalPrice())}");
        return   receipt.toString();
    }
}







