import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: Scaffold(
        appBar: AppBar(
          title: Text('KU App'),
        ),
        body: Image.network(
          'https://drive.google.com/uc?export=view&id=1yXLay3mbDe4HbBr3lImHOKpCE6uun3Wj',
          height: 100,
          width: 100,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
