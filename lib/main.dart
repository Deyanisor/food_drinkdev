import 'package:flutter/material.dart';
import 'package:food_drinkdev/providers/Api_provider.dart';
import 'package:food_drinkdev/screens/especilidad_screen.dart';
import 'package:food_drinkdev/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppApiProvider());

class AppApiProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ApiProvider(),
          lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fooo & Drink',
      initialRoute: EspeciliadadStreen.id,
      routes: {
        EspeciliadadStreen.id: (context) => EspeciliadadStreen(),
        HomeScreen.id: (context) => HomeScreen(),
        // Splash.id: (context) => Splash(),
        //LoginScreen.id: (context) => LoginScreen(),
        //RegistrationScreen.id: (context) => RegistrationScreen(),
      },
      theme: theme.copyWith(
          brightness: Brightness.light,
          primaryColor: Colors.deepOrange,
          colorScheme:
              theme.colorScheme.copyWith(secondary: Colors.orangeAccent),
          appBarTheme: AppBarTheme(color: Colors.deepOrange)),
    );
  }
}
