import 'package:flutter/material.dart';
import 'package:food_drinkdev/providers/Api_provider.dart';
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
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fooo & Drink',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'details': (_) => DetailsScreen(),
      },
      theme: ThemeData.light()
          .copyWith(appBarTheme: AppBarTheme(color: Colors.deepOrange)),
    );
  }
}
