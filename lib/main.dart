import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'flutter demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('hell fuckerms'),
        ),
        body: Text(
          'Hell fuck app fsskutter',
          style: TextStyle(fontSize: 32.0),
        )
      )
    );
  }
}
