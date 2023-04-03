import 'package:final_project/createBillEqual.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import './bill.dart';
import './postFeed.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({super.key});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  @override
  Widget build(BuildContext context) {
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
                  child: const Text('Khuntung\'s Bill',
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

              Padding(padding: EdgeInsets.only(top: 220)),

              Center(
                child: Column(
                  children: [
                ElevatedButton(
                  onPressed: () {
                      Navigator.pushNamed (
                        context, "/mybill");
                    }, child: const Text("My Bill"),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      fixedSize: Size.fromWidth(200),
                      primary: Colors.lightGreen,
                      shadowColor: Colors.black,
                  )
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
          Padding(padding: EdgeInsets.only(top: 220)),
          Center(
              child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/mybill");
                  },
                  child: const Text("My Bill"),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    fixedSize: Size.fromWidth(200),
                    primary: Colors.lightGreen,
                    shadowColor: Colors.black,
                  )),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/friendBill');
                  },
                  child: const Text("Friend\'s Bill"),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    fixedSize: Size.fromWidth(200),
                    primary: Colors.lightGreen,
                    shadowColor: Colors.black,
                  )),
            ],
          )),
          Container(
            margin: const EdgeInsets.only(left: 280.0, right: 20, top: 250),
            child: ElevatedButton(
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CreateBillEqualScreen()))
                    },
                child: const Text('Add Bill'),
                style: ElevatedButton.styleFrom(shape: StadiumBorder())),
          )
        ],
      ),
    )));
  }
}
