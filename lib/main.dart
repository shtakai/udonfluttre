import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    final title = 'Fxxkter title';

    @override
    Widget build(BuildContext context) {
      return new MaterialApp(
      title: 'fuck kill destroy',
      home: new MyHomePage(
        title: this.title,
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title}): super();

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message;
  IconData _icon = Icons.star;
  bool _isFlipped = false;

  @override
  void initState() {
    super.initState();
    _message = 'HELLo';
  }

  void _setMessage() {
    setState(() {
      if (_isFlipped) {
        _message = '12345';
        _icon = Icons.access_alarm;
      } else {
        _message = 'ABCDE';
        _icon = Icons.mic;
      }
      _isFlipped = !_isFlipped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Text(
        _message,
        style: TextStyle(fontSize: 38.0),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _setMessage,
          tooltip: 'set message',
        child: Icon(_icon),
      ),
    );
  }
}