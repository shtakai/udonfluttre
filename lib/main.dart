import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'fuck kill destroy',
      home: new FirstScreen(),
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
  String _input = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('fucked home'),
      ),
      body: Column(
        children: <Widget>[
          Text(
            'Home Screen',
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w400,
              color: Colors.red,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          TextField(
            controller: _controller,
            style: TextStyle(
              fontSize: 32.0,
            ),
            onChanged: changeField,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('next'),
            icon: Icon(Icons.navigate_next),
          ),
        ],
        onTap: (int value) {
          if (value == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen(_input)),
            );
          }
        },
      ),
    );
  }

  void changeField(String val) => _input = val;
}

class SecondScreen extends StatelessWidget {
  final String _value;

  SecondScreen(this._value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('next'),
      ),
      body: Center(
        child: Text(
          'you typed: "$_value".',
          style: TextStyle(
            fontSize: 32.0,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('prev'),
            icon: Icon(Icons.navigate_before),
          ),
          BottomNavigationBarItem(
            title: Text('?'),
            icon: Icon(Icons.android),
          ),
        ],
        onTap: (int value) {
          if (value == 0) Navigator.pop(context);
        },
      ),
    );
  }
}
