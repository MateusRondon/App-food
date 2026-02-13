import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../Pages/homePage.dart';
import 'login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          //Quando usuario estiver com login ativo no banco de dados 
          if(snapshot.hasData){
            return   HomePage();
          }
          // Quando usuario nao estiver com usuario cadastrado no banco de dados...
          else {
            return   LoginOrRegister(onTap: () {  },);
          }
        },
      )
    );
  }
}