import 'package:flutter/material.dart';

import '../Pages/cart_page.dart';
class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({super.key, required this.child,required this.title});
  final Widget child;
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      collapsedHeight: 70,
      actions: [
        IconButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context)=> 
              const CartPage(),
              )
              );
        },
        icon: const Icon(Icons.confirmation_num),
        ),
      ],
      floating: false,
      pinned: true,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      foregroundColor: Theme.of(context).colorScheme.secondary,
      title: Text(' Tela Principal'),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(
          left: 0,
          right: 0,
          top: 0
          ),
        expandedTitleScale: 1,

      ),
    );
  }
}