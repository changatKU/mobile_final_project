import './postFeed_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'models/postFeed.dart';
import 'package:final_project/login.dart';
import './createBillEqual.dart';

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

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: 
              [
              Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                    onPressed: () {
                      Navigator.push (
                      context, MaterialPageRoute(
                      builder: (context) => const LoginScreen() // change route
                ),);
                  }, child: const Text('Log out'))),

                  const Padding(padding: EdgeInsets.only(right: 150.0)),

                  Row(
                    children: const [
                      Icon(
                        Icons.account_circle,
                        size: 20.0
                    ),
                  
                  Padding(padding: EdgeInsets.only(left: 3.0)),
                  Text('User', style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ))],
                  ),
              ],),

              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push (
                        context, MaterialPageRoute(
                          builder: (context) => const PostFeedScreen()
                    ),);
                    }, child: const Text('Feed'),
                  ),


                  ElevatedButton(
                    onPressed: () {
                      Navigator.push (
                        context, MaterialPageRoute(
                          builder: (context) => const CreateBillEqualScreen()
                    ),);
                    }, child: const Text('Bill'),
                  ),

              ],),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: 
                ListView.builder(
                  itemCount: postList.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          postList[index].topic,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          postList[index].location,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.blueGrey,
                          ),
                        ),
                        trailing: Text(postList[index].description,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.blueGrey,
                            )),
                      ),
                    );
                  }),
              ),
            Container(
              margin: const EdgeInsets.only(left: 250.0, right: 20),
              child: ElevatedButton (
                  onPressed: () => {
                    showPostFeedDialog()
            }, child: const Text('Add'),),
            )
            ]

            ),
            ),   
            ),
    );
  }
}
