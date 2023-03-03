// import 'dart:html';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String linkImage =
      'https://drive.google.com/uc?export=view&id=1yXLay3mbDe4HbBr3lImHOKpCE6uun3Wj';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'KU App',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              linkImage,
              width: 100,
              height: 100,
            ),
            Container(
                margin:
                    const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Username',
                      hintStyle: TextStyle(fontSize: 20),
                      focusColor: Colors.green),
                )),
            Container(
                margin:
                    const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Password',
                      hintStyle: TextStyle(fontSize: 20),
                      focusColor: Colors.green),
                )),
            TextButton(onPressed: () {}, child: const Icon(Icons.login)),
            TextButton(
                onPressed: () {},
                child: const Text('I don\'t have an account')),
          ],
        ),
      ),
    );
  }
}
