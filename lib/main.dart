import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final title = 'Fxxkter title';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'fuck kill destroy',
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
      },
    );
  }
}

class FirstScreen extends StatefulWidget {
  FirstScreen({Key key}) : super(key: key);

  @override
  _FirstScreenState createState() => new _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _controller = TextEditingController();
  final _fname = 'assets/data.txt';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('firstscreen'),
      ),
      body: Column(
        children: <Widget>[
          Text(
            'Home screen',
            style: TextStyle(
              fontSize: 32.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          TextField(
            controller: _controller,
            maxLines: 5,
            style: TextStyle(
              fontSize: 32.0,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.open_in_new),
        onPressed: () => setState(() {
          loadIt().then((String value) {
            setState(() {
              _controller.text = value;
            });
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text('loaded'),
                content: Text('load message from asset'),
              ),
            );
          });
        }),
      ),
    );
  }

  Future<String> getDataAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  Future<String> loadIt() async {
    try {
      return await getDataAsset(_fname);
    } catch (e) {
      return null;
    }
  }
}
