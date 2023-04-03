import './postFeed_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'models/postFeed.dart';
import 'package:final_project/login.dart';
import './createBillEqual.dart';
import './bill.dart';

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
              Container(
                child: Center(
                  child: const Text('Khuntung\'s Feed',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                  )),
                )      
              ),

              
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 120.0)),
                  ElevatedButton(
                    
                    onPressed: () {
                      Navigator.push (
                        context, MaterialPageRoute(
                          builder: (context) => const PostFeedScreen()
                    ),);
                    }, child: const Text('Feed'),
                    style: ElevatedButton.styleFrom (
                      shape: StadiumBorder(),
                      primary: Colors.green,
                      shadowColor: Colors.black,
                  ),),

                  Padding(padding: EdgeInsets.only(left: 15.0)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push (
                        context, MaterialPageRoute(
                          builder: (context) => const BillScreen()
                    ),);
                    }, child: const Text('Bill'),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Colors.green,
                      shadowColor: Colors.black,
                      )
                  ),

              ],),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
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
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          postList[index].location,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black26,
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
              margin: const EdgeInsets.only(left: 280.0, right: 20),
              child: ElevatedButton (
                  onPressed: () => {
                    showPostFeedDialog()
            }, child: const Text('Add Feed'),
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder())
            ),
            
            
            ),           
            ]

            ),
            ),   
            ),
    );
  }
}
