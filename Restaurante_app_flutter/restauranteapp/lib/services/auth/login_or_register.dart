import 'package:flutter/material.dart';

import '../../Pages/login_Page.dart';
import '../../Pages/register_page.dart';

class LoginOrRegister extends StatefulWidget{
    final void Function()? onTap;
   const LoginOrRegister (
      {
      super.key,
      required this.onTap
      }
    );
   @override
    State<LoginOrRegister> createState()=> _LoginOrRegisterState();

}
class _LoginOrRegisterState extends State<LoginOrRegister> {
 
  bool showLoginPage = true;
  void togglePages(){
    setState(() { 
      showLoginPage = !showLoginPage;
        }
        );

  }
   @override
   Widget build (BuildContext context){
    if( showLoginPage){
      return LoginPage(onTap:togglePages );
    }else {
      return RegisterPage(onTap: togglePages);
    }

   }
}