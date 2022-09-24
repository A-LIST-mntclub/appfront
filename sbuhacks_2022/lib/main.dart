import 'package:flutter/material.dart';
import 'homePage.dart';
import 'entry.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/entry': (context) => Entry(),
      },
    );
  }
}
