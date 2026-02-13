import 'package:flutter/material.dart';
import 'package:flutter_app/components/my_textfield.dart';
import 'package:flutter_app/components/my_button.dart';

import '../services/auth/auth_services.dart';
//import 'homePage.dart';

class LoginPage extends StatefulWidget {
  
 
  final void Function()? onTap;
  const LoginPage({super.key,required this.onTap});
   @override 
  State<LoginPage> createState()=> _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  //edicao de texto
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void login()async{
      final _authService  = AuthService();
    
      try{
        await _authService.signInWithEmailPassword(emailController.text,passwordController.text,);
      }catch(e){
         showDialog(
          context: context,
          builder:(context)=>
          AlertDialog(
            title: 
            Text("Conta de usuario nao cadastrado ou login e senha incorreta"),
            ),
    );
      }
  }
  void forgotPw(){
    showDialog(
          context: context,
          builder:(context)=>
          AlertDialog(
            title: 
            Text("User Tapped forgot password"),
            ),
    );
  }
  @override 
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        children: [
        
         
          Text("Monte Seu Cupom  😊",
          style: TextStyle(
          fontSize: 25,
          color: Theme.of(context).colorScheme.inversePrimary,

          ),
        ),

        // Text(" E monte seu lanche 🍕",
        //   style: TextStyle(
        //   fontSize: 16,
        //   color: Theme.of(context).colorScheme.inversePrimary,
        //   ),
        // ),
        Icon(
            Icons.av_timer,
            size: 25,
            color: Theme.of(context).colorScheme.inversePrimary,
        ),
          const SizedBox(height: 25),

        Text("Login"),
        const SizedBox(height: 10),
        //Email
        MyTextField(
          controller: emailController,
          hintText: "Email",
          obscuredText: false,
        ),

        const SizedBox(height: 10),
        //Password
        MyTextField(
          controller: passwordController,
          hintText: "Password",
          obscuredText: true ,
        ),


        const SizedBox(height: 10),
        //Botao de Confirmacao
        MyButton(
          text: "Confirmar",
          onTap: login,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nao esta Registrado?",
            style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(width:4),
            
            GestureDetector(
            onTap: widget.onTap,
            child: Text("Registrar",
            style: TextStyle(
            color: Theme.of(context).colorScheme.primary),
            //fontWeight: FontWeight.bold,
            
            ),
            
          ),
          ],
        )
        ],
      )
      ),
    );
  }

  Null get child => null;
}

