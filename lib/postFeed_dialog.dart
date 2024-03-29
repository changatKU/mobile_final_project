import 'package:final_project/postFeed.dart';
import 'package:flutter/material.dart';
import './postFeed.dart';
import 'models/postFeed.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './models/api.dart';
import './models/user.dart';

class AddPostFeedDialog extends StatefulWidget {
  final Function(Post) addPost;
  AddPostFeedDialog(this.addPost);

  @override
  State<AddPostFeedDialog> createState() => _AddPostFeedDialogState();
}

class _AddPostFeedDialogState extends State<AddPostFeedDialog> {
  @override
  Widget build(BuildContext context) {
    Widget buildTextfield(String hint, TextEditingController controller) {
      return Container(
          margin: EdgeInsets.all(4),
          child: TextField(
              decoration: InputDecoration(
                labelText: hint,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45)),
              ),
              controller: controller));
    }

    var topicController = TextEditingController();
    var locationController = TextEditingController();
    var descriptionController = TextEditingController();

    return Container(
        padding: EdgeInsets.only(top: 40),
        height: 350,
        width: 400,
        child: Column(
          children: [
            Text('Add Feed',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Color.fromARGB(255, 1, 116, 60),
                )),
            buildTextfield('Topic', topicController),
            buildTextfield('Location', locationController),
            buildTextfield('Description', descriptionController),
            ElevatedButton(
              onPressed: () {
                final String apiUrl = Api.apiUrl + 'api/posts';
                final post = Post(topicController.text, locationController.text,
                    descriptionController.text);
                final uri = Uri.parse(apiUrl);
                final headers = {'Content-Type': 'application/json'};
                final json = jsonEncode({
                  "phone": User.phone,
                  "topic": post.topic,
                  "location": post.location,
                  "description": post.description
                });

                final response = http.post(uri, headers: headers, body: json);
                print(response);
                // widget.addPost(post);
                Navigator.of(context).pop();
              },
              child: Text('Add'),
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(), primary: Colors.green),
            ),
          ],
        ));
  }
}
