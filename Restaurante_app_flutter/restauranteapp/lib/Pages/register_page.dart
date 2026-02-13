import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../services/auth/auth_services.dart';
class RegisterPage extends StatefulWidget {
   final void Function()? onTap;
  const RegisterPage ({super.key,required this.onTap});
  @override
    State<RegisterPage> createState()=> _RegisterPageState();

  
}
class _RegisterPageState extends State<RegisterPage> {
  //edicao de texto
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();
void register()async{
    final _authService  = AuthService();
    if(passwordController.text == confirmpasswordController.text){
      try{
        await _authService.signUpWithEmailPassword(emailController.text,passwordController.text,);
      }catch(e){
        showDialog(
          context: context,
          builder:(context)=>
          AlertDialog(
            title: 
            Text(e.toString()
            ),
            ),
            );
      }
    }
  else {
  showDialog(
          context: context,
          builder:(context)=>
          const  AlertDialog(
            title: 
            Text("Password Error"),
            //Quando A senha estiver errado 
            //Comparando 
            ),
            );
  }

}
void login(){

  
}

  @override 
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        children: [
          Icon(
            Icons.email,
            size: 100,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          const SizedBox(height: 25),
          Text("Criando a Conta",
          style: TextStyle(
          fontSize:16,
          color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),

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
          obscuredText: true,
        ),

        const SizedBox(height: 10),
        //Confirm Password
        MyTextField(
          controller: confirmpasswordController,
          hintText: "ConfirmPassword",
          obscuredText: true && false, // Esconde a senha
        ),

        const SizedBox(height: 25),
        //Sign Up de Confirmacao
        MyButton(
          text: "Criar Conta",
          onTap: register,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Conta ja registrada",
            style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(width:4),
            GestureDetector(
              onTap: widget.onTap,
             
            child: Text("Login",
            style: TextStyle(
            color: Theme.of(context).colorScheme.primary),
          
            ),
            
          ),
          ],
        )
        ],
      )
      ),
    );
  }
}