import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';
import '../models/restaurant.dart';
import '../components/my_button.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};
  final Map<Tamanho, bool> selectedTamanho = {};

  FoodPage({
    super.key,
    required this.food,
    //required this.selectedAddons,
  }) {
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
    for (Tamanho tamanho in food.availableTamanho) {
      selectedTamanho[tamanho] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    Navigator.pop(context);
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    List<Tamanho> currentlySelectedTamanho = [];
    for (Tamanho tamanho in widget.food.availableTamanho) {
      if (widget.selectedTamanho[tamanho] == true) {
        currentlySelectedTamanho.add(tamanho);
      }
    }
    context
        .read<Restaurant>()
        .addToCart(food, currentlySelectedAddons, currentlySelectedTamanho);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Scaffold
        Scaffold(
          //appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                //imagem Comidas
                Image.asset(widget.food.imagePath),

                //nome da comida
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.food.description,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          //color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                      const SizedBox(height: 10),

                      Text(
                        "Adicionar Extras",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      //Text(" ",style: TextStyle(color: Theme.of(context).colorScheme.primary,)),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            //borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: widget.food.availableAddons.length,
                            itemBuilder: (context, index) {
                              Addon addon = widget.food.availableAddons[index];
                              return CheckboxListTile(
                                title: Text(addon.name),
                                subtitle: Text('R\$' + addon.price.toString()),
                                secondary: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      addon.imagemExtra, // Imagem associada ao addon
                                      width: 40, // Defina o tamanho da imagem
                                      height: 40, // Defina o tamanho da imagem
                                      fit: BoxFit
                                          .cover, // Ajuste a imagem para cobrir o espaço disponível
                                    ),
                                    const SizedBox( width: 8), // Adiciona um espaçamento entre a imagem e o texto
                                  ],
                                ),
                                value: widget.selectedAddons[addon],
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.selectedAddons[addon] = value!;
                                  });
                                },
                                activeColor: Color.fromARGB(255, 235, 9, 9),
                                // Define a cor do checkbox 
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            //borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: widget.food.availableTamanho.length,
                            itemBuilder: (context, index) {
                              Tamanho tamanho =
                                  widget.food.availableTamanho[index];
                              return CheckboxListTile(
                                title: Text(tamanho.tm),
                                subtitle:
                                    Text('R\$' + tamanho.price.toString()),
                                value: widget.selectedTamanho[tamanho],
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.selectedTamanho[tamanho] = value!;
                                  });
                                },
                                activeColor: Colors.red,
                                // Define a cor do checkbox como preto
                              );
                            }),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                //add para o cart
                MyButton(
                  onTap: () => addToCart(widget.food, widget.selectedAddons),
                  text: "Adicionar ao Cart",
                ),
                const SizedBox(height: 55),
              ],
            ),
          ),
        ),
        // bottao voltar
        const SizedBox(height: 25),
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(left: 25), // Tamanho do circolo
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Theme.of(context).colorScheme.tertiary, 
                ),
                
                onTapDown: (_) {
                  // adicionar um efeito visual
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
