import 'package:final_project/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './models/api.dart';
import './bill.dart';

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
      bills.sort((a, b) => a['status'].compareTo(b['status']));
      print(bills.length);

      // return data;

      // return false;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      // return false;
      throw Exception();
    }
  }

  Future<void> updateData(int id) async {
    final String _apiUrl = Api.apiUrl + "api/membersOfBill/" + id.toString();
    print(_apiUrl);
    final Map<String, String> _headers = {"Content-type": "application/json"};
    final Map<String, dynamic> _data = {"test": 2};

    final http.Response _response = await http.put(
      Uri.parse(_apiUrl),
      headers: _headers,
      body: jsonEncode(_data),
    );

    if (_response.statusCode == 200) {
      print("Data updated successfully");
    } else {
      print("Error updating data: ${_response.statusCode}");
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
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BillScreen() // change route
                      ),
                );
              },
              child: const Text('Back'),
              style: ElevatedButton.styleFrom(shape: StadiumBorder())),
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.75,
            child: ListView.builder(
              itemCount: bills.length,
              itemBuilder: (BuildContext context, int index) {
                if (bills[index]["status"] == 0) {
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.person),
                          title: Text(bills[index]["topic"].toString(),
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                              )),
                          subtitle: Text(
                              "by : " +
                                  bills[index]["owner_name"] +
                                  "\n" +
                                  bills[index]["amount"].toString() +
                                  " ฿",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 78, 75, 75),
                                fontWeight: FontWeight.w600,
                              )),
                          onTap: () {
                            // Bill.bill_id = bills[index]["id"];
                            // print(Bill.bill_id);
                          },
                        ),
                        Text("Unpaid",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 228, 37, 37),
                              fontWeight: FontWeight.w600,
                            )),
                        TextButton(
                            onPressed: () {
                              print("hello" + bills[index]["id"].toString());
                              setState(() {
                                updateData(bills[index]["id"]);
                                bills.sort((a, b) =>
                                    a['status'].compareTo(b['status']));
                              });
                            },
                            child: Text('Click to pay'))
                      ],
                    ),
                  );
                } else {
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.person),
                          title: Text(bills[index]["topic"].toString(),
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                              )),
                          subtitle: Text(
                              "by : " +
                                  bills[index]["owner_name"] +
                                  "\n" +
                                  bills[index]["amount"].toString() +
                                  " ฿",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 78, 75, 75),
                                fontWeight: FontWeight.w600,
                              )),
                          onTap: () {
                            // Bill.bill_id = bills[index]["id"];
                            // print(Bill.bill_id);
                          },
                        ),
                        Text("Paid",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 33, 125, 230),
                              fontWeight: FontWeight.w600,
                            ))
                      ],
                    ),
                  );
                }
              },
            )),
        FloatingActionButton(
          onPressed: () {
            setState(() {});
          },
          child: Icon(Icons.refresh),
        )
      ],
    ))));
  }
}
