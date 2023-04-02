import 'package:flutter/material.dart';
import 'model/postFeed.dart';

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
              borderSide: BorderSide(color: Colors.black45)
            ),
          ),
          controller: controller
        )
      );
    }
    
    var topicController = TextEditingController();
    var locationController = TextEditingController();
    var descriptionController = TextEditingController();
    return Container(
      padding: EdgeInsets.all(8),
      height: 300,
      width: 400,
      child: Column(
        children: [
        Text(
          'Add Post',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.black12,
          )
        ),
        buildTextfield('Topic', topicController),
        buildTextfield('Location', locationController),
        buildTextfield('Description', descriptionController),
        ElevatedButton(
        onPressed: () {
          final post = Post(topicController.text, locationController.text,
          descriptionController.text);

          widget.addPost(post);
        }, 
        child: Text('Add Post'),
        ),
      ],
      )
    );
  }
}