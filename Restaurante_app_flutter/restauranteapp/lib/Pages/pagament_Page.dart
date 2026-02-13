import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../components/my_button.dart';
import 'delivery_progress_Page.dart';
class PagamentPage extends StatefulWidget {
  const PagamentPage({super.key});

  @override
  State<PagamentPage> createState() => _PagamentPageState();
}

class _PagamentPageState extends State<PagamentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate= '';
  String cardHolderName= '';
  String cvvCode= '';
  bool isCvvFoucose = false;

 void userTappedPay(){
  if(formKey.currentState!.validate()){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirmar Pagamento"),
        content: SingleChildScrollView(
          child: ListBody (
            children: [
              Text("Card numero:       $cardNumber"),
              Text("ExpiryDate:           $expiryDate"),
              Text("cardHolderName:  $cardHolderName"),
              Text("cvvCode:           $cvvCode"),
            ],
          ),
        ),
        actions: [
          // Cancelamento do pagamento
          
          TextButton(
            onPressed: ()=> Navigator.pop(context),
            child: const Text("Cancelar "),
          ),
          
        
          // Confirmacao
            TextButton(
            onPressed: () {
               Navigator.pop(context);
              Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context)=> DeliveryProgressPage(),
              ),
            );
            },
            child: const Text("Sim "),
          )
        ],
      ),
    );
  }
 }//userTappedPay
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Pagamento"),
      ),
      body: Column(
        //Cartao  de Credito 
        children: [
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView:isCvvFoucose,
            onCreditCardWidgetChange: (p0){},
          ),
          CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (data){
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;   
              });
            },
            formKey: formKey,
          ),
         // const Spacer(),
          MyButton(
            //userTappedPay
            onTap: userTappedPay,
            text: "Pagar",
          ),
          const SizedBox(height: 9),
        ],
      ),
    );
  }
}