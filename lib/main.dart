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
  var _gridData = <Widget>[
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
    Container(
      color: Colors.pink,
      width: 200.0,
      height: 200.0,
      child: Text(
        "Touch me I'm Sick",
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.w400,
          fontFamily: "Roboto",
        ),
      ),
    ),
    Container(
      color: Colors.pinkAccent,
      width: 200.0,
      height: 200.0,
      child: Text(
        "imode",
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.w400,
          fontFamily: "Roboto",
        ),
      ),
    ),
    Container(
      color: Colors.deepOrangeAccent,
      width: 200.0,
      height: 200.0,
      child: Text(
        "iphone",
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
        body: GridView.extent(
          maxCrossAxisExtent: 150.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          padding: EdgeInsets.all(10.0),
          children: _gridData,
        ));
  }

  void fabPressesed() {
    setState(() {});
  }
}
