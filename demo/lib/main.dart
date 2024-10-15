import 'package:demo/pages/shopping.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
      ),
      debugShowCheckedModeBanner: false,
      home: const ShoppingPage(),
    );
  }
}

main() => runApp(const App());