import 'package:get/get.dart';

import './postFeed_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'models/postFeed.dart';
import 'package:final_project/login.dart';
import './createBillEqual.dart';
import './bill.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './models/api.dart';

void main() {
  runApp(MaterialApp(home: PostFeedScreen()));
}

class PostFeedScreen extends StatefulWidget {
  const PostFeedScreen({super.key});

  @override
  State<PostFeedScreen> createState() => _PostFeedScreenState();
}

class _PostFeedScreenState extends State<PostFeedScreen> {
  List<Post> postList = [];

  @override
  Widget build(BuildContext context) {
    final String apiUrl = Api.apiUrl + "api/posts";
    List<dynamic> items = [];
    Future<void> fetchData() async {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        postList.clear();
        final data = jsonDecode(response.body);
        print(data);
        items = data;
        print(items.length);
        for (int i = 0; i < items.length; i++) {
          postList.add(new Post(items[i]['topic'], items[i]['location'],
              items[i]['description']));
        }
        // return data;

        // return false;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        // return false;
        throw Exception();
      }
    }

    void addPostData(Post post) {
      setState(() {
        postList.add(post);
      });
    }

    void showPostFeedDialog() {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              content: AddPostFeedDialog(addPostData),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            );
          });
    }

    fetchData();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    child: Center(
                  child: const Text('Khuntung\'s Feed',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                      )),
                )),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 120.0)),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Text('Feed'),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: Colors.green,
                        shadowColor: Colors.black,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 15.0)),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BillScreen()),
                          );
                        },
                        child: const Text('Bill'),
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: Colors.green,
                          shadowColor: Colors.black,
                        )),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (ctx, index) {
                        return Card(
                          child: ListTile(
                            leading: Icon(Icons.person),
                            title: Text(
                              postList[index].topic,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Column(
                              children: [
                                Row(children: [
                                  Icon(Icons.location_pin),
                                  Text(postList[index].location)
                                ]),
                              ],
                            ),
                            onTap: () {},
                          ),
                        );
                      }),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 280.0, right: 20),
                  child: ElevatedButton(
                      onPressed: () => {showPostFeedDialog()},
                      child: const Text('Add Feed'),
                      style: ElevatedButton.styleFrom(shape: StadiumBorder())),
                ),
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        child: Icon(Icons.logout),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }
}
