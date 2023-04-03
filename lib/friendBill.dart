import 'package:final_project/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './models/api.dart';

class FriendBillScreen extends StatefulWidget {
  const FriendBillScreen({super.key});

  @override
  State<FriendBillScreen> createState() => _FriendBillScreenState();
}

class _FriendBillScreenState extends State<FriendBillScreen> {
  final String apiUrl = Api.apiUrl + "api/membersOfBill/friend/";
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
        body: Center(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: ListView.builder(
                  itemCount: bills.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (bills[index]["status"] == 0) {
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text(bills[index]["amount"].toString()),
                          subtitle: Text("Not paid\nhello"),
                          onTap: () {
                            // Bill.bill_id = bills[index]["id"];
                            // print(Bill.bill_id);
                          },
                        ),
                      );
                    } else {
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text(bills[index]["amount"].toString()),
                          subtitle: Text("Paid\nhello"),
                          onTap: () {
                            // Bill.bill_id = bills[index]["id"];
                            // print(Bill.bill_id);
                          },
                        ),
                      );
                    }
                  },
                ))));
  }
}
