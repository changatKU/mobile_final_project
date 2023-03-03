import 'package:flutter/material.dart';
import './login.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: const LoginScreen(),
    );
  }
}
