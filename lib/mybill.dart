import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './models/api.dart';

class MyBillScreen extends StatefulWidget {
  const MyBillScreen({super.key});

  @override
  State<MyBillScreen> createState() => _MyBillScreenState();
}

class _MyBillScreenState extends State<MyBillScreen> {
  final String apiUrl = Api.apiUrl + "api/bills/";
  List<dynamic> bills = [];
  Future<void> fetchData(String phone) async {
    final response = await http.get(Uri.parse(apiUrl + phone));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      bills = data;
      print(bills.length);

      // return data;

      // return false;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      // return false;
      throw Exception();
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchData("0844057805");
    return Scaffold(
        body: Center(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: ListView.builder(
                  itemCount: bills.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text(bills[index]["topic"]),
                        subtitle: Text(bills[index]["topic"]),
                        onTap: () {
                          // Handle item tap
                        },
                      ),
                    );
                  },
                ))));
  }
}
