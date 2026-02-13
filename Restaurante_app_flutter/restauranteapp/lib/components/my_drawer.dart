import 'package:flutter/material.dart';

import '../Pages/delivery_progress_Page.dart';
import '../services/auth/auth_services.dart';
import 'my_drawer_Tile.dart';
import 'package:flutter_app/Pages/settings_page.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void logout() {
      final _authService=AuthService();
      _authService.signOut();
}

  @override
  Widget build(BuildContext context) {

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              //cadedo
              Icons.foggy,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          //Pagina Principal
          MyDrawerTile(
            text: "Principal",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          //Pagina De Configuracao
          MyDrawerTile(
            text: "Configs",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  SettingPage(),
                  ));
            },
          ),
            MyDrawerTile(
            text: "Historico",
            icon: Icons.confirmation_num,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  DeliveryProgressPage(),
                  ));
            },
          ),
          //Pagina para Sair
          const SizedBox(height: 200),
          MyDrawerTile(
            text: "Sair",
            icon: Icons.logout,
            onTap: () {
             logout();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

