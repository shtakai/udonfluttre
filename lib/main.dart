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
  int _index;

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
              ListTile(
                leading: const Icon(Icons.android),
                title: const Text('fuck all'),
                selected: _index == 1,
                onTap: () {
                  _index = 1;
                  tapTile();
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text('suck all'),
                selected: _index == 2,
                onTap: () {
                  _index = 2;
                  tapTile();
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite_border),
                title: const Text('destroy all'),
                selected: _index == 3,
                onTap: () {
                  _index = 3;
                  tapTile();
                },
              ),
              ListTile(
                leading: const Icon(Icons.airplanemode_inactive),
                title: const Text('メーデー'),
                selected: _index == 4,
                onTap: () {
                  _index = 4;
                  tapTile();
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  void tapTile() {
    setState(() {
      _message = 'You fucked: No, $_index.';
    });
  }
}
