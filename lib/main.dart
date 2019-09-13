import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

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
  final _fname = 'mydata.txt';

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
            style: TextStyle(
              fontSize: 32.0,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('save'),
            icon: Icon(Icons.save),
          ),
          BottomNavigationBarItem(
            title: Text('load'),
            icon: Icon(Icons.open_in_new),
          ),
        ],
        onTap: (int value) {
          switch (value) {
            case 0:
              saveIt(_controller.text);
              setState(() {
                _controller.text = '';
              });
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text('saved'),
                  content: Text('save message to file'),
                ),
              );
              break;
            case 1:
              loadIt().then((String value) {
                setState(() {
                  _controller.text = value;
                });
              });
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text('loaded'),
                  content: Text('load message from file'),
                ),
              );
              break;
            default:
              print('no default');
          }
        },
      ),
    );
  }

  Future<File> getDataFile(String filemane) async {
    final directory = await getApplicationDocumentsDirectory();
    return File(directory.path + '/' + filemane);
  }

  void saveIt(String value) async {
    getDataFile(_fname).then((File file) {
      file.writeAsString(value);
    });
  }

  Future<String> loadIt() async {
    try {
      final file = await getDataFile(_fname);
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
