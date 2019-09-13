import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final title = 'Fxxkter title';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'fuck kill destroy',
        home: new MyHomePage(
          title: this.title,
        ));
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({this.title}) : super();

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/sauna.png'),
        ),
      ),
    );
  }
}
