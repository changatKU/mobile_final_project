import 'dart:ffi';

import 'package:final_project/main.dart';
import 'package:final_project/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CreateBillEqualScreen extends StatefulWidget {
  const CreateBillEqualScreen({super.key});

  @override
  State<CreateBillEqualScreen> createState() => _CreateBillEqualScreenState();
}

class _CreateBillEqualScreenState extends State<CreateBillEqualScreen> {
  TextField createBillField(
      String hint_text, TextInputType textInputType) {
    return TextField(
      decoration: InputDecoration(
        labelText: hint_text,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
        hintText: hint_text,
        hintStyle: TextStyle(fontSize: 10, height: 2.0),
        contentPadding: EdgeInsets.only(left: 80),
        //textAlign: TextAlign.center
      ),
      keyboardType: textInputType,
    );
  }

  @override
  Widget build(BuildContext context) {
    // List<Widget> widget=<Widget>[];

    return Scaffold (
      // appBar: AppBar (
      //   title: Text ('Create Bill',),
      // centerTitle: true,
    // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
            Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisSize: MainAxisSize.min, children: //Header
        [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: 
          [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton (
              onPressed: () {
                Navigator.push (
                context, MaterialPageRoute(
                builder: (context) => const RegisterScreen() // change route
                ),);
              }, 
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children:
            [
              Icon(
                Icons.arrow_back_outlined,
                size: 15.0),
                Padding(padding: EdgeInsets.only(left: 6.0)),
                Text('Back'),
              ],),),),
          
            Padding(padding: EdgeInsets.only(right: 150.0)),

            Container(
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children:
            [
              Icon(
              Icons.account_circle,
              size:20.0
              ),

           Padding(padding: EdgeInsets.only(left: 6.0)),
           Text('User', style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
           ),),],))
           
          ],), // heder ending
        Container(
          margin: EdgeInsets.only(top: 20.0, left: 115.0),
          child: Text('Create Bill', style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold, 
          )),
        ),

        Container(
          margin: EdgeInsets.only(top: 20.0, left: 20.0),
          child: Text('Topic', style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600, 
          )),
        ),

        Container(
          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: createBillField('Type Topic', TextInputType.text)
        ),

        Container(
          margin: EdgeInsets.only(top: 20.0, left: 20.0),
          child: Text('Amount', style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600, 
          )),
        ),

        Container(
          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: createBillField('Type Amount (e.g. 500 Baht)', TextInputType.number)
        ),

        Container(
          margin: EdgeInsets.only(top: 20.0, left: 20.0),
          child: Text('Bank Account', style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600, 
          )),
        ),

        Container(
          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: createBillField('Type Bank Account Number', TextInputType.text)
        ),

        Container(
          margin: EdgeInsets.only(top: 20.0, left: 20.0),
          child: Text('Member', style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,          
          )),
        ),

        // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children:
        // [],),

        Container(
          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 70.0),
          child:
            // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children:
            // [
              createBillField('Type Phone Number', TextInputType.text), 
            // ],),
          ),
        
        Container(
          child: ElevatedButton (
            onPressed: () {
              Navigator.push (
              context, MaterialPageRoute(
                builder: (context) => const RegisterScreen() // change route
                ),);
              }, 
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children:
            [
              Icon(
                Icons.arrow_back_outlined,
                size: 15.0),
                Padding(padding: EdgeInsets.only(left: 6.0)),
                Text('Add'),
              ],),),
          
          ),


         ],), 
        ),
    ),
    );
  }
}


