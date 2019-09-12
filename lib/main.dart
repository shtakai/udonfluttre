import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final title = 'Fxxkter title';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'fuck kill destroy app',
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              color: Colors.blue,
              height: 150.0,
              child: const Center(
                child: Text(
                  'One',
                  style: const TextStyle(fontSize: 32.0),
                ),
              ),
            ),
            Container(
              color: Colors.yellowAccent,
              height: 150.0,
              child: const Center(
                child: Text(
                  'Two',
                  style: const TextStyle(fontSize: 32.0),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              height: 150.0,
              child: const Center(
                child: Text(
                  'Three',
                  style: const TextStyle(fontSize: 32.0),
                ),
              ),
            ),
            Container(
              color: Colors.yellowAccent,
              height: 150.0,
              child: const Center(
                child: Text(
                  'Four',
                  style: const TextStyle(fontSize: 32.0),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              height: 150.0,
              child: const Center(
                child: Text(
                  'Fiv',
                  style: const TextStyle(fontSize: 32.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
