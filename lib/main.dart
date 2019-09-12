import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: const Color(0xFFe91e63),
        accentColor: const Color(0xFFe91e63),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _stackData = <Widget>[
    Container(
      color: Colors.red,
      width: 200.0,
      height: 200.0,
      child: Text(
        "Fuck",
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.w400,
          fontFamily: "Roboto",
        ),
      ),
    ),
    Container(
      color: Colors.green,
      width: 200.0,
      height: 200.0,
      child: Text(
        "Kill",
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.w400,
          fontFamily: "Roboto",
        ),
      ),
    ),
    Container(
      color: Colors.blue,
      width: 200.0,
      height: 200.0,
      child: Text(
        "Destroy",
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.w400,
          fontFamily: "Roboto",
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Take a Fucking Stand'),
      ),
      body: Stack(
        children: _stackData,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.android),
        onPressed: fabPressesed,
      ),
    );
  }

  void fabPressesed() {
    setState(() {
      _stackData.insert(0, _stackData.removeLast());
    });
  }
}
