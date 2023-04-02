import 'package:final_project/postFeed_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'model/postFeed.dart';

void main() {
  runApp(
    MaterialApp(
    home : PostFeedScreen()
    ));
}

class PostFeedScreen extends StatefulWidget {
  const PostFeedScreen({super.key});

  @override
  State<PostFeedScreen> createState() => _PostFeedScreenState();
}

class _PostFeedScreenState extends State<PostFeedScreen> {
  @override
  Widget build(BuildContext context) {
      
    List<Post> postList = [];
    void addPostData(Post post) {
      setState(() {
        postList.add(post);
      });
    }

    void showPostFeedDialog() {
      showDialog(context: context, builder: (_){
        return AlertDialog(
          content: AddPostFeedDialog(addPostData),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))  
        );
      });
    }


    return Scaffold(
      floatingActionButton: FloatingActionButton(
      onPressed: showPostFeedDialog,
      child: Icon(Icons.add),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        child: ListView.builder(itemBuilder: (ctx, index){
          return Card(
            child: ListTile(
              title: Text(postList[index].topic,
              style: TextStyle(
                fontSize: 22,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w600,
              ),),
              subtitle: Text(postList[index].location,
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
              ),
              ),
              trailing: Text(postList[index].description,
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
              )),
            ),
            );
        }
      )
    ));
  }
}