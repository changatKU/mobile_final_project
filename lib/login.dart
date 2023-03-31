import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'widgets/header_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextField createTextField(
      String hint_text, TextInputType textInputType, bool isPassword) {
    return TextField(
      decoration: InputDecoration(
        labelText: hint_text,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
        hintText: hint_text,
        hintStyle: TextStyle(fontSize: 20),
      ),
      keyboardType: textInputType,
      obscureText: isPassword,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Login',
          ),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              // Container( 
              //   child: HeaderWidget()
              // ),
                Image.asset(
                  'assets/images/app-logo.png',
                  height: 150,
                  width: 150,
                ),
                Container(
                  margin:
                      const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: createTextField(
                      'Phone number', TextInputType.phone, false),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: createTextField(
                      'Password', TextInputType.visiblePassword, true),
                ),
                TextButton(onPressed: () {}, child: Text('Login')),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text('I don\'t have an account')),
              ],
            ),
          ),
        ));
  }
}
