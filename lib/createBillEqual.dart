import 'dart:ffi';

import 'package:final_project/main.dart';
import 'package:final_project/models/user.dart';
import 'package:final_project/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './models/api.dart';
import './login.dart';
import './bill.dart';

class CreateBillEqualScreen extends StatefulWidget {
  const CreateBillEqualScreen({super.key});

  @override
  State<CreateBillEqualScreen> createState() => _CreateBillEqualScreenState();
}

class _CreateBillEqualScreenState extends State<CreateBillEqualScreen> {
  final phone = TextEditingController();
  final topic = TextEditingController();
  final amount = TextEditingController();
  final bank = TextEditingController();
  final bank_number = TextEditingController();
  List<String> phoneNumberList = [];
  Map<String, dynamic> nameList = {};

  TextField createTextField(String hint_text, TextInputType textInputType,
      TextEditingController textEditingController) {
    return TextField(
      decoration: InputDecoration(
        labelText: hint_text,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
        hintText: hint_text,
        hintStyle: TextStyle(fontSize: 10, height: 1.5),
      ),
      keyboardType: textInputType,
      controller: textEditingController,
      obscureText: false,
    );
  }

  final String apiUrl = Api.apiUrl + 'api/';
  Future<void> fetchData(String phone) async {
    final response = await http.get(Uri.parse(apiUrl + 'users/' + phone));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      nameList.addAll({phone: data[0]["name"]});
      print(nameList);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void sendJsonData(
      String _phone,
      String _topic,
      double _amount,
      String _bank_account,
      String _bank_account_number,
      List<Map<String, dynamic>> _members) async {
    final uri = Uri.parse(apiUrl + 'membersOfBill/');
    final headers = {'Content-Type': 'application/json'};
    final json = jsonEncode({
      "phone": _phone,
      "topic": _topic,
      "amount": _amount,
      "bank_account": _bank_account,
      "bank_account_number": _bank_account_number,
      "members": _members
    });

    final response = await http.post(uri, headers: headers, body: json);

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const BillScreen() // change route
                          ),
                    );
                  },
                  child: const Text('Back'),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder())),
            ),

            Container(
              margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
              alignment: Alignment.centerLeft,
              child: const Text('Topic',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child:
                  createTextField('eg. Food, Drink', TextInputType.name, topic),
            ),
            // Container(
            //   margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            //   alignment: Alignment.centerLeft,
            //   child: const Text('Amount',
            //       style: TextStyle(
            //         fontSize: 20,
            //         fontWeight: FontWeight.w600,
            //       )),
            // ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: createTextField('eg. 1000.50', TextInputType.name, amount),
            ),
            // Container(
            //   margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            //   alignment: Alignment.centerLeft,
            //   child: const Text('Bank Name',
            //       style: TextStyle(
            //         fontSize: 20,
            //         fontWeight: FontWeight.w600,
            //       )),
            // ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: createTextField(
                  'eg. SCB, Prompay', TextInputType.number, bank),
            ),
            // Container(
            //   margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            //   alignment: Alignment.centerLeft,
            //   child: const Text('Bank Account ID',
            //       style: TextStyle(
            //         fontSize: 20,
            //         fontWeight: FontWeight.w600,
            //       )),
            // ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: createTextField(
                  'eg. 2354536789', TextInputType.number, bank_number),
            ),
            // Container(
            //   margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            //   alignment: Alignment.centerLeft,
            //   child: const Text('Member',
            //       style: TextStyle(
            //         fontSize: 20,
            //         fontWeight: FontWeight.w600,
            //       )),
            // ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: createTextField(
                  'Enter phone number', TextInputType.phone, phone),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    phoneNumberList.add(phone.text);
                  });
                },
                child: const Text("Add")),
            Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: ListView.builder(
                  itemCount: phoneNumberList.length,
                  itemBuilder: (BuildContext context, int index) {
                    fetchData(phoneNumberList[index]);
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text(phoneNumberList[index]),
                        subtitle: Text(phoneNumberList[index]),
                        onTap: () {
                          // Handle item tap
                        },
                      ),
                    );
                  },
                )),
            TextButton(
                onPressed: () {
                  print("Hello");

                  double total = double.parse(amount.text);
                  List<Map<String, dynamic>> members = [];
                  for (int i = 0; i < phoneNumberList.length; i++) {
                    members.add({
                      "phone": phoneNumberList[i],
                      "amount": (total / (phoneNumberList.length + 1))
                    });
                  }
                  print(members);

                  sendJsonData(User.phone, topic.text, total, bank.text,
                      bank_number.text, members);
                },
                child: Text('Create'))
          ],
        ),
      ),
    ));
  }
}
