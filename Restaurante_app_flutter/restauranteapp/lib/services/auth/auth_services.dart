import 'package:firebase_auth/firebase_auth.dart';
class AuthService { 
  //auth firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //get
  User? getCurrentUser(){
    return _firebaseAuth.currentUser;
  }
  //sign in 
  Future<UserCredential> signInWithEmailPassword(String email,password) async{
    //User  in
    //Entrar 
    try{
      UserCredential userCredential = 
      await _firebaseAuth.signInWithEmailAndPassword(email:email,password: password,);
      return userCredential;
    }
    //Quando houver erros
    on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }
    
    //Inscrever 
    //login
    Future<UserCredential> signUpWithEmailPassword(String email,password) async{
    try{
      //Metodo para verificar autentificacao
      UserCredential userCredential = 
      await _firebaseAuth.createUserWithEmailAndPassword(email:email,password: password,);
      return userCredential;
      // debugprint("erro");
    }
    //Quando houver erros
    on FirebaseAuthException catch(e){
      throw Exception(e.code);
     // SnackBar(content: Text('Text De confir'),);
    }
  }
  //sing out 
  Future<void> signOut  ()async {
    return await _firebaseAuth.signOut();
  }
   
}