import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './models/api.dart';
import './bill.dart';
import './models/bill.dart';
import './models/user.dart';

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
    fetchData(User.phone);
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
             children: [
                Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(16.0),
                    child: 
                    ElevatedButton(
                    onPressed: () {
                      Navigator.push (
                      context, MaterialPageRoute(
                      builder: (context) => const BillScreen() // change route
                ),);
                  }, child: const Text('Back'),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder())),
                  ),
                
                Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: ListView.builder(
                    itemCount: bills.length,
                    itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text(
                          bills[index]["topic"],
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(bills[index]["topic"]),
                        onTap: () {
                          Bill.bill_id = bills[index]["id"];
                          print(Bill.bill_id);
                          Navigator.pushNamed(context, "/my-sub-bill");
                        },
                      ),
                    );
                  },
                ),
                ),
          ],)
        )));
  }
}
