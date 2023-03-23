import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextField createTextField(
      String hint_text, TextInputType textInputType, bool isPassword) {
    return TextField(
      decoration: InputDecoration(
        labelText: hint_text,
        border: OutlineInputBorder(),
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
          title: Text(
            'Register',
          ),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Image.asset(
                'assets/images/app-logo.png',
                height: 100,
                width: 100,
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: createTextField('Name', TextInputType.name, false),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child:
                    createTextField('Phone number', TextInputType.phone, false),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: createTextField(
                    'Password', TextInputType.visiblePassword, true),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: createTextField(
                    'Confirm password', TextInputType.visiblePassword, true),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Register"),
              ),
            ]),
          ),
        ));
  }
}
