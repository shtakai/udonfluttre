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
  String _message = '';

  @override
  void initState() {
    _message = 'ok';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Text(
            _message,
            style: TextStyle(
              fontSize: 32.0,
            ),
          ),
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              Text(
                'Kill em all',
                style: TextStyle(fontSize: 24.0),
              ),
              Text(
                'Fuck em all',
                style: TextStyle(fontSize: 24.0),
              ),
              Text(
                'Suck em all',
                style: TextStyle(fontSize: 24.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}
