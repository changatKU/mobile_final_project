import 'package:flutter/material.dart';
import './login.dart';
import './register.dart';
import 'createBillEqual.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {
        // '/': (context) => LoginScreen(),
        // '/register': (context) => RegisterScreen(),
        '/' : (context) => CreateBillEqualScreen()
      },
    );
  }
}
