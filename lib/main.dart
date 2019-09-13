import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        });
  }
}

class FirstScreen extends StatefulWidget {
  FirstScreen({Key key}) : super(key: key);

  @override
  _FirstScreenState createState() => new _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _controller = TextEditingController();
  double _r = 0.0;
  double _g = 0.0;
  double _b = 0.0;

  @override
  void initState() {
    super.initState();
    loadPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PRef sampl'),
      ),
      body: Container(
        color: Color.fromARGB(200, _r.toInt(), _g.toInt(), _b.toInt()),
        child: Column(
          children: <Widget>[
            Text('Home screen'),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Slider(
              min: 0,
              max: 255.0,
              value: _r,
              divisions: 255,
              onChanged: (double value) {
                setState(() {
                  _r = value;
                });
              },
            ),
            Slider(
              min: 0,
              max: 255.0,
              value: _g,
              divisions: 255,
              onChanged: (double value) {
                setState(() {
                  _g = value;
                });
              },
            ),
            Slider(
              min: 0,
              max: 255.0,
              value: _b,
              divisions: 255,
              onChanged: (double value) {
                setState(() {
                  _b = value;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.open_in_new),
        onPressed: () {
          savePref();
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text('saved'),
              content: Text('save prefs'),
            ),
          );
        },
      ),
    );
  }

  void loadPref() async {
    SharedPreferences.getInstance().then((SharedPreferences prefs) {
      setState(() {
        _r = (prefs.getDouble('r') ?? 0.0);
        _g = (prefs.getDouble('g') ?? 0.0);
        _b = (prefs.getDouble('b') ?? 0.0);
        _controller.text = (prefs.getString('input') ?? '');
      });
    });
  }

  void savePref() async {
    SharedPreferences.getInstance().then((SharedPreferences prefs) {
      prefs.setDouble('r', _r);
      prefs.setDouble('g', _g);
      prefs.setDouble('b', _b);
      prefs.setString('input', _controller.text);
    });
  }
}
