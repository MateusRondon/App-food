import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/restaurant.dart';




class MyCurrentLocation extends StatelessWidget {
  
   MyCurrentLocation({super.key});
  final  textController = TextEditingController();
  void openLocationSearchBox (BuildContext context){
    
    showDialog(
    context: context,
    builder: (context)=>AlertDialog(
      title: const Text("Entre Localizacao"),
      content:const TextField(
        decoration: const InputDecoration(hintText:"Buscar Localizacao"),

      ),
      actions: [
        MaterialButton (
          onPressed: ()=> Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
         MaterialButton (
          onPressed:(){

        
          String newAddress = textController.text;
          context.read<Restaurant>().updateDeliveryAddress(newAddress);
          Navigator.pop(context);
          textController.clear();
          },
          child: const Text('Salvar'),
        ),
      ],
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivery now",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            GestureDetector(
                onTap: ()=> openLocationSearchBox(context),
              child: Row(children: [
                  //Endereco 
                  Consumer<Restaurant>(
                    builder: (context, restaurant, child) => Text(
                      restaurant.deliverylocalization,
                      style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      ),
                    )
                  ),
                  
                  //drop 
                  Icon(Icons.keyboard_arrow_down_rounded),
                ],
                ),
            
            )
          ],
      ),
    );
  }
}