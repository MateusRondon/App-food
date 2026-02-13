import 'package:flutter/material.dart';
class MyDescrptionBox extends StatelessWidget {
  const MyDescrptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    var myPrimaryTextStyle = TextStyle(color: Theme.of(context).colorScheme.primary);
    var mySecondaryTextStyle = TextStyle(color: Theme.of(context).colorScheme.primary);
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border:Border.all(color:Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(25),
        margin:const  EdgeInsets.only(left: 20,right: 20, bottom: 10),
        child: Row(
          //Colaca em ordem Column 1 a esquerda e Column 2 a direita
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Column 1 Preco e Descrisao do alimento
            Column (
            children: [
                FittedBox(
                  fit: BoxFit.scaleDown, // Ajusta para o tamanho do espaço disponível
                  child: Text(
                  'Combo de lanche',
                  style: myPrimaryTextStyle,
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown, // Ajusta para o tamanho do espaço disponível
                  child: Text(
                  'Faça de acordo que está disponivel',
                  style: myPrimaryTextStyle,
                  ),
                ),
              ],
            ),
            //Column 2 Tempo do Preparo do alimento
            Column (
            children: [
                FittedBox(
                  fit: BoxFit.scaleDown, // Ajusta para o tamanho do espaço disponível
                  child: Text(
                  'Sistema de controle',
                  style: myPrimaryTextStyle,
                  ),
                ),
                 FittedBox(
                  fit: BoxFit.scaleDown, // Ajusta para o tamanho do espaço disponível
                  child: Text(
                    'Gerenciamento de Mercado e farmacia',
                  style: mySecondaryTextStyle,
                  ),
                ),
                  const SizedBox(height: 10),
              ],

            ),
          ],
        ),
      ),
    );
  }
}