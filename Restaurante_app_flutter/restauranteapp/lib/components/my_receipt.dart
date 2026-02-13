import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/restaurant.dart';
class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,right: 25,bottom: 25,top: 50,
        ),
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const   Text("Obrigado pela escolha"),
          const   Text("Seu Recibo"),
          const   SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color:Theme.of(context).colorScheme.inversePrimary),
                borderRadius: BorderRadius.circular(25),
              ),
              padding: const EdgeInsets.all(20),
              child: Consumer<Restaurant>(
                builder : 
                (context,restaurant,child)=>
              Text(restaurant.displayCartRecibo(),
              ),
              ),
            ),
               const   SizedBox(height: 25),
               const   Text("Tempo Estimado Para Entrega"),
               const   SizedBox(height: 30),
               const   SizedBox(width: 30),
            ],
          ),
        ),
    );
  }
}