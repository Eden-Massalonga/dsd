import 'package:flutter/material.dart';
import 'screens/menu.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSD UEM',
      theme: ThemeData.light().copyWith(primaryColor: Colors.green[900]),
      darkTheme: ThemeData.dark(),
      home: Menu(),
    );
  }
}
