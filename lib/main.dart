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
  String _selected = 'Fuck';

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
          Align(
            alignment: Alignment.centerRight,
            child: PopupMenuButton(
              onSelected: (String value) => popupSelected(value),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem(
                  child: const Text('Fuck'),
                  value: 'Fuck',
                ),
                const PopupMenuItem(
                  child: const Text('Kill'),
                  value: 'Kill',
                ),
                const PopupMenuItem(
                  child: const Text('Destroy'),
                  value: 'Destroy',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void popupSelected(String value) {
    setState(() {
      _selected = value;
      _message = 'select $_selected';
    });
  }
}
