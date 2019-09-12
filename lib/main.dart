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
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title}) : super();

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class Data {
  int _price;
  String _name;

  Data(this._name, this._price) : super();

  @override
  String toString() {
    return _name + ':' + _price.toString() + '円';
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String _message;

  @override
  void initState() {
    _message = 'ok';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fuck ?Name'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            _message,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          RaisedButton(
            onPressed: buttonPressed,
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Fuck me',
              style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.red,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto'),
            ),
          ),
        ],
      ),
    );
  }

  void buttonPressed() {
    showDialog(
        context: context,
        builder: (BuildContext context) => Container(
              color: Colors.white70,
              child: Text(
                'Fucked up',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            ));
  }
}
