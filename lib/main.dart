import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: MyRenderBoxWidget(),
      ),
    );
  }
}

class MyRenderBoxWidget extends SingleChildRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    return _MyRenderBox();
  }
}

class _MyRenderBox extends RenderBox {
  @override
  bool hitTest(HitTestResult result, {@required Offset position}) {
    return true;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas c = context.canvas;

    int dx = offset.dx.toInt();
    int dy = offset.dy.toInt();

    Paint p = Paint();
    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(150, 0, 200, 255);

    Rect r = Rect.fromLTWH(dx + 150.0, dy + 50.0, 150.0, 150.0);

    c.drawRect(r, p);
    p.style = PaintingStyle.stroke;
    p.color = Color.fromARGB(150, 200, 0, 255);
    p.strokeWidth = 10.0;

    r = Rect.fromLTWH(dx + 100.0, dy + 100.0, 150.0, 150.0);
    c.drawRect(r, p);
  }
}
