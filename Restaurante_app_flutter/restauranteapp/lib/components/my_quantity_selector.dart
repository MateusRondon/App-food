 import 'package:flutter/material.dart';
import '../models/food.dart';
class QuantitySelector extends StatelessWidget {
    final int quantity;
    final Food food;
    final VoidCallback onDecrement;
    final VoidCallback onIncrement;
  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onDecrement,
    required this. onIncrement,
    required this.food,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      
      margin: const EdgeInsets.symmetric(horizontal: 15 ,vertical: 15),
      padding:  const EdgeInsets.all(1),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,

            children: [
          
          const SizedBox(height: 30),
              GestureDetector(
                //Decrementa o botao
                onTap: onDecrement,
                child: Icon(
                  Icons.remove,
                  size:20,
                  color: Theme.of(context).colorScheme.primary,
                  ),  
              ),
             Padding (
                padding:EdgeInsets.symmetric(horizontal:10),
                child:Center(
                  child:Text(
                    quantity.toString(),
                  ),
                ),
              ),
              GestureDetector(
                //Decrementa o botao
                onTap: onIncrement,
                child: Icon(
                  Icons.add,
                  size:20,
                  color: Theme.of(context).colorScheme.primary,
                  ),  
              ),
              
            ],
            
        ),
      ),
    );
  }
}