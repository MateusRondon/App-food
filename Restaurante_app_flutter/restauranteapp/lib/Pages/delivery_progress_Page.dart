import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/person_salve_page.dart';
import '../components/my_receipt.dart';
import '../models/restaurant.dart';
import '../services/database/firestore.dart';
import 'package:provider/provider.dart'; 

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  FirestoreService db = FirestoreService();

  @override
    void initState() {
      
      super.initState();
      String receipt = context.read<Restaurant>().displayCartRecibo();
      db.saveOrderToDatabase(receipt);
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: Column(
        children: [
          
          MyReceipt(),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context){
    return Container(
      height: 100,
      decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.inversePrimary,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Container(
            //edicao de perfil do usuario
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyPersonPage()
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
            //details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sistema de cupons",
                style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                   color: Theme.of(context).colorScheme.primary,
                ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                //Mensagem
               Container(
              //edicao de perfil do usuario
              decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              shape: BoxShape.circle,
              ),
              child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyPersonPage()
                  ),
                );
              },
              icon: const Icon(Icons.message),
               color: Theme.of(context).colorScheme.primary,
              ),
            ),
            //cal bottom
              const SizedBox(height: 10),
            Center(
               child: Container(
              //edicao de perfil do usuario
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                shape: BoxShape.circle,
              ),
              //telefone de contato
            child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.call),
                color: Colors.green,
            ),
            ),
             ),
              ],
            ),
            
        ],
      ),
    );
  }
}