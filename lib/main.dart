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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            _message,
            style: TextStyle(
              color: const Color(0XFF000000),
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
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) => Column(
              children: <Widget>[
                Text(
                  'This is moron.',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                FlatButton(
                  onPressed: () => Navigator.pop<String>(context, 'Fuck Off'),
                  child: Text(
                    'Fuck Off',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.cyan,
                    ),
                  ),
                ),
              ],
            )).then<void>((value) => resultAlert(value));
  }

  void resultAlert(String value) {
    setState(() {
      if (value == null) {
        value = 'Moron!';
      }
      _message = 'selected: $value';
    });
  }
}
