import 'package:flutter/material.dart';
import '../models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(children:[
            //Imagem
            ClipRRect(
            borderRadius: BorderRadius.circular(30),
           child: Image.asset(food.imagePath, height: 120),// trocar imagem depois
           ),
             Expanded(child: Column(children: [
              Text(food.name),
              Text(''+food.price.toString(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary
                  ),
                ),
                const SizedBox(height:10),
              Text(food.description,style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary
              ),
              ),
              ],
              )
            ),
          ],
          //Imagem
          
          ),
        ),
        ),
         Divider(
          color: Theme.of(context).colorScheme.tertiary,
        endIndent: 25,
        indent: 25,
        )

      ],
    );
  }
}