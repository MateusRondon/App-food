import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/providers/auth_provider.dart';
import 'core/providers/cart_provider.dart';
import 'core/providers/restaurant_provider.dart';
import 'core/providers/order_provider.dart';
import 'core/providers/theme_provider.dart';
import 'core/routes/app_router.dart';

void main() {
  runApp(MyApp());
}

@override 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => RestaurantProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: 'Food Delivery App',
            debugShowCheckedModeBanner: false,
            theme:  ThemeData(
            colorScheme: ColorScheme.fromSeed(
            seedColor: const Colors (0xFFEA1D2C),
            brightness: Brightness.light,
              ),
            textTheme: GoogleFonts.interTextTheme(),
            useMaterial3: true,
            ),            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFFEA1D2C),
                brightness: Brightness.dark,
              ),
              textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
              useMaterial3: true,
            ),//
            themeMode:themProvider.themeMode,
            routerConfig:AppRouter.router,
          );
        },
      ),
    );
  }
}