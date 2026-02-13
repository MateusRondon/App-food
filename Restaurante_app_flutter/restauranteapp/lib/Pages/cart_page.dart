import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/my_cart_tile.dart';
import '../models/restaurant.dart';
import 'package:provider/provider.dart';
import 'delivery_progress_Page.dart';
// import 'pagament_Page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder:(context, restaurant, child) {
      final userCart = restaurant.cart;
      return Scaffold(
        appBar: AppBar(
          title: Text("Seu Combo"),
          backgroundColor: Color.fromARGB(0, 230, 16, 16),
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            IconButton(onPressed: (){
              showDialog(
                context: context,
                builder: (context) =>AlertDialog(
                  title: Text("Tem certeza de que deseja limpar o historico de cupons?"),
                  actions: [
                    // Cancelar opercao
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancelar"),
                    ),
                    
                    // sim
                     TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                        restaurant.clearCart();
                      },
                      child: const Text("Sim"),
                    ),
                  ],
                )
              );
            },
            icon: const Icon(Icons.delete),)
          ],
          
        ),
        body: Column(
          children: [

            Expanded(
              child: Column(
                children: [
              userCart.isEmpty ?
              const  Expanded(child: 
                Center(
                //se o cart estiver fazio
                child: Text("Nenhuma Combo Adicionada"),
                ),
              ): 
               Expanded(
                  child:ListView.builder(
                  
                  itemCount: userCart.length,
                  itemBuilder: (context,index){
                  final cartItem = userCart[index];
                      //final cart_market = userCarts[index];
                    return MyCartTile(cartItem: cartItem);
                  } 
                  ),
                  ),
              ],
                ),
            ),
            //button no carrinho para ir ao pagamento 
            MyButton(
            
              onTap:()=> Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=>const DeliveryProgressPage(),
                ),
                ),
              text: "Salvar Historico"
            ),
            const SizedBox(height: 8),
             MyButton(
            
              onTap:()=> Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> DeliveryProgressPage(),
                ),
                ),
              text: "Ir Para Ao historico de Combos"
            ),
            const SizedBox(height: 8),
          ],
        ),
      );
    },
    );
  }
}