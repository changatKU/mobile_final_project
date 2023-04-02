import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextField createTextField(String hint_text, TextInputType textInputType,
      bool isPassword, TextEditingController textController) {
    return TextField(
      decoration: InputDecoration(
        labelText: hint_text,
        border: OutlineInputBorder(),
        hintText: hint_text,
        hintStyle: TextStyle(fontSize: 20),
      ),
      keyboardType: textInputType,
      obscureText: isPassword,
      controller: textController,
    );
  }

  final String apiUrl = 'http://10.0.2.2/api/users';

  Future<void> makePostRequest(
      String name, String phone, String password) async {
    final response = await http.post(Uri.parse(apiUrl),
        body: {'name': name, 'password': password, 'phone': phone});

    if (response.statusCode == 200) {
      // Request successful, handle response data
      var responseData = json.decode(response.body);
      print(responseData);
    } else {
      // Request failed, handle error
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    final phone = TextEditingController();
    final name = TextEditingController();
    final password = TextEditingController();
    final confirm_password = TextEditingController();

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
                child: createTextField('Name', TextInputType.name, false, name),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: createTextField(
                    'Phone number', TextInputType.phone, false, phone),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: createTextField(
                    'Password', TextInputType.visiblePassword, true, password),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: createTextField('Confirm password',
                    TextInputType.visiblePassword, true, confirm_password),
              ),
              TextButton(
                onPressed: () {
                  if (password.text == confirm_password.text) {
                    // makePostRequest(name.text, phone.text, password.text);
                    name.clear();
                    phone.clear();
                    password.clear();
                    confirm_password.clear();
                    Navigator.pushNamed(context, '/');
                  }
                },
                child: Text("Register"),
              ),
            ]),
          ),
        ));
  }
}
