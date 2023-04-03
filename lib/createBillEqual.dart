import 'dart:ffi';

import 'package:final_project/main.dart';
import 'package:final_project/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'models/phoneNumber_model.dart';


class CreateBillEqualScreen extends StatefulWidget {
  const CreateBillEqualScreen({super.key});

  @override
  State<CreateBillEqualScreen> createState() => _CreateBillEqualScreenState();
}

class _CreateBillEqualScreenState extends State<CreateBillEqualScreen> {
  List<PhoneNumber> phoneNumberList = [];
  var itemPhoneNumber = '';
  late String temp;
  
  get child => null;
  TextField createBillField(String hint_text, TextInputType textInputType) 
  {
      return TextField(
      decoration: InputDecoration(
        labelText: hint_text,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
        hintText: hint_text,
        hintStyle: TextStyle(
          fontSize: 10, 
          height: 1.5),
        contentPadding: EdgeInsets.only(left: 70),
      ),
      keyboardType: textInputType,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: SafeArea(
        child: SingleChildScrollView(
          child:
            Column (
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
          child: TextField(
      decoration: InputDecoration(
        labelText: 'Type Topic',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
        hintText: 'Type Topic',
        hintStyle: TextStyle(fontSize: 10, height: 2.0),
        contentPadding: EdgeInsets.only(left: 140),

      ),
      keyboardType: TextInputType.text,
    )
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
          child: Row(
            children: [
              Row(children: const [
                Text('Member', style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),),
                Text(' (Seach by Phone Number)', style: TextStyle(
                  fontSize: 12,
                  height: 1.5,
                  fontWeight: FontWeight.w600
                )),
              ],)
            ],
          ),
        ),

        Container(
          margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20),
          child: Column(
            children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                hintText: "Type Phone Number",
                labelText: "Type Phone Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.0),
                  ),),
                isDense: true,
                hintStyle: TextStyle(
                    fontSize: 10, 
                    height: 4.5),
                contentPadding : EdgeInsets.only(left: 100),
              ),),
            ElevatedButton (
              onPressed: () {
                setState(() {
                  phoneNumberList.add(itemPhoneNumber as PhoneNumber);
                });
              },
              child: Text('Add'),
            ),
          ],)
          ),

          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            child: 
                ListView.builder(itemBuilder: (ctx, index) {
                  return Card(
                    child: ListTile(
                    title: Text(phoneNumberList[index].phoneNumber),
                  ),);
                }, itemCount: phoneNumberList.length)

          ),
            
        ],),),
        
      ),
      ); 
  }
}




