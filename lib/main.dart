import 'package:flutter/material.dart';
import './login.dart';
import './register.dart';
import 'createBillEqual.dart';
import 'splash_screen.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  Color _primaryColor = HexColor('#1688a3');
  Color _accentColor = HexColor('#39817d');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
          primaryColor: _primaryColor,
          scaffoldBackgroundColor: Colors.grey.shade100,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
              .copyWith(secondary: _accentColor)),
      initialRoute: '/',
      home: SplashScreen(title: 'KhungTung'),
      routes: {
        '/register': (context) => RegisterScreen(),
        '/bill-equal': (context) => CreateBillEqualScreen()
      },
    );
  }
}
