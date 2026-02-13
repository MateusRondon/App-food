import 'package:provider/provider.dart';
import '../models/restaurant.dart';
import '../models/cart_item.dart';
import '../components/my_quantity_selector.dart';
import 'package:flutter/material.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartItem.food.imagePath, // A imagem extra do item
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Nome e preço do item
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cartItem.food.name), // Nome do item
                      const SizedBox(height: 10),
                      Text('A Partir de: R\$' + cartItem.food.price.toString()), // Preço do item
                      const SizedBox(height: 10),
                      QuantitySelector(
                        quantity: cartItem.quantity,
                        food: cartItem.food,
                        onDecrement: () {
                          restaurant.removeCart(cartItem);
                        },
                        onIncrement: () {
                          restaurant.addToCart(
                            cartItem.food,
                            cartItem.selectedAddons,
                            cartItem.selectedTamanho,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),

            // Exibe addons
           SizedBox(
  height: cartItem.selectedAddons.isEmpty ? 0 : 60,
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: cartItem.selectedAddons
        .map(
          (Addon) => Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              label: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Alinha os itens à esquerda (ou use 'center' ou 'end' para outros alinhamentos)
                crossAxisAlignment: CrossAxisAlignment.center, // Centraliza verticalmente os itens no Row
                children: [
                  Text(Addon.name), // Nome do addon
                  const SizedBox(width: 10), // Espaçamento entre nome e preço
                  Text("R\$ " + Addon.price.toString()), // Preço do addon
                  const SizedBox(width: 10), // Espaçamento entre o preço e a imagem
                  // Imagem extra do produto
                  Image.asset(
                    Addon.imagemExtra, // Caminho da imagem extra do food
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover, // Ajuste da imagem
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              shape: StadiumBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              onSelected: (value) {},
              labelStyle: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 12,
              ),
            ),
          ),
        )
        .toList(),
  ),
  ),
            // Exibe Tamanho
            SizedBox(
              height: cartItem.selectedTamanho.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: cartItem.selectedTamanho
                    .map(
                      (Tamanho) => Padding(
                        padding: const EdgeInsets.only(right: 2.0),
                        child: FilterChip(
                          label: Row(
                            children: [
                              Text(Tamanho.tm),
                              const SizedBox(height: 10),
                              const SizedBox(width: 10),
                              Text("R\$ " + Tamanho.price.toString()),

                           
                            ],
                          
                        
                          ),
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                          onSelected: (value) {},
                          labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
