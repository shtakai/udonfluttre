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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Take a Fucking Stand'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Fuck",
            style: TextStyle(
              fontSize: 32.0,
              color: Color(0xFF000000),
              fontWeight: FontWeight.w400,
              fontFamily: "Roboto",
            ),
          ),
          Text(
            "Kill",
            style: TextStyle(
              fontSize: 32.0,
              color: Color(0xFF000000),
              fontWeight: FontWeight.w400,
              fontFamily: "Roboto",
            ),
          ),
          Text(
            "Destroy",
            style: TextStyle(
              fontSize: 32.0,
              color: Color(0xFF000000),
              fontWeight: FontWeight.w400,
              fontFamily: "Roboto",
            ),
          ),
        ],
      ),
    );
  }

  void fabPresses() {}
}
