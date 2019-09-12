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
  final String title;

  MyHomePage({this.title}) : super();

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _items = <Widget>[];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 100; i++) {
      var item = Container(
        color: i.isOdd ? Colors.blue : Colors.white,
        height: 100.0,
        child: Center(
          child: Text(
            'No, $i',
            style: const TextStyle(fontSize: 32.0),
          ),
        ),
      );
      _items.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Sliver App Bar'),
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.network(
                    'https://www.rakuten.ne.jp/gold/rtm-select/wifi-rental/itempage/20_04_30d.jpg',
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.android),
                tooltip: 'icon button',
                onPressed: () {
                  print('pressed');
                },
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(_items),
          ),
        ],
      ),
    );
  }
}
