import 'package:flutter/material.dart';

import './models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './models/api.dart';
import 'package:flutter/cupertino.dart';
import 'widgets/header_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextField createTextField(String hint_text, TextInputType textInputType,
      bool isPassword, TextEditingController myController) {
    return TextField(
      decoration: InputDecoration(
        labelText: hint_text,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
        hintText: hint_text,
        hintStyle: TextStyle(fontSize: 20),
      ),
      keyboardType: textInputType,
      obscureText: isPassword,
      controller: myController,
    );
  }

  final String apiUrl = Api.apiUrl + 'api/users/';

  Future<bool> fetchData(String phone, String password) async {
    final response = await http.get(Uri.parse(apiUrl + phone));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      print(data[0]['password']);
      if (password == data[0]['password']) {
        return true;
      }
      return false;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final phone = TextEditingController();
    final password = TextEditingController();

    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/app-logo.png',
              height: 150,
              width: 150,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: createTextField(
                  'Phone number', TextInputType.phone, false, phone),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: createTextField(
                  'Password', TextInputType.visiblePassword, true, password),
            ),
            TextButton(
                onPressed: () async {
                  if (await fetchData(phone.text, password.text)) {
                    User.phone = phone.text;
                    Navigator.pushNamed(context, '/bill-equal');
                  }
                },
                child: Text('Login')),
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
