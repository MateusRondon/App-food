import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';

// import '../temas/theme_provider.dart';

class SettingPage extends StatelessWidget {

  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text("Configuração"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Alterar Tema",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  // Usando listen: true para atualizar o valor do estado
                  // CupertinoSwitch(
                  //   // value: Provider.of<ThemeProvider>(context).isDarkMode,
                  //   value: Provider.of(context),
                  //   onChanged: (value) {
                  //     // Alterando o tema com a função toggleTheme()
                  //     Provider.of<ThemeProvider>(context, listen: true).toggleTheme();
                  //   },
                  // ),
                  // Dando Erro por isso está comentado
                ],
              ),
            ),
          ],
        ),
      ),
    );
}
