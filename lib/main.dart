import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'dart:ui' as ui;
import 'dart:io';
import 'dart:typed_data';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'fuckamela',
      theme: new ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: const Color(0xFFe91363),
        accentColor: const Color(0xFFe91363),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyImagePage(),
    );
  }
}

class MyImagePage extends StatefulWidget {
  @override
  _MyImagePageState createState() => new _MyImagePageState();
}

class _MyImagePageState extends State<MyImagePage> {
  File image;
  GlobalKey _homeStateKey = GlobalKey();
  List<List<Offset>> strokes = new List<List<Offset>>();
  MyPainter _painter;
  ui.Image targetimage;
  Size mediasize;
  double _r = 255.0;
  double _g = 0.0;
  double _b = 0.0;

  _MyImagePageState() {
    requestPermission();
  }

  void requestPermission() async {
    await SimplePermissions.requestPermission(Permission.Camera);
    await SimplePermissions.requestPermission(Permission.WriteExternalStorage);
  }

  @override
  Widget build(BuildContext context) {
    mediasize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Canture Image Drawing'),
      ),
      body: Listener(
        onPointerDown: _pointerDown,
        onPointerMove: _pointerMove,
        child: Container(
          child: CustomPaint(
            key: _homeStateKey,
            painter: _painter,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
            ),
          ),
        ),
      ),
      floatingActionButton: image == null
          ? FloatingActionButton(
              onPressed: getImage,
              tooltip: 'take a picture',
              child: Icon(Icons.add_a_photo),
            )
          : FloatingActionButton(
              onPressed: saveImage,
              tooltip: 'save image',
              child: Icon(Icons.save),
            ),
      drawer: Drawer(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'set color',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Slider(
                  min: 0.0,
                  max: 255.0,
                  value: _r,
                  onChanged: sliderR,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Slider(
                  min: 0.0,
                  max: 255.0,
                  value: _r,
                  onChanged: sliderG,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Slider(
                  min: 0.0,
                  max: 255.0,
                  value: _r,
                  onChanged: sliderB,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sliderR(double value) {
    setState(() {
      _r = value;
    });
  }

  void sliderG(double value) {
    setState(() {
      _g = value;
    });
  }

  void sliderB(double value) {
    setState(() {
      _b = value;
    });
  }

  void createMyPainter() {
    var strokecolor = Color.fromARGB(200, _r.toInt(), _g.toInt(), _b.toInt());

    _painter = MyPainter(targetimage, image, strokes, mediasize, strokecolor);
  }

  void getImage() async {
    File file = await ImagePicker.pickImage(source: ImageSource.camera);
    image = file;
    loadImage(image.path);
  }

  void saveImage() {
    _painter.saveImage();
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text('saved'),
              content: Text('save image to file'),
            ));
  }

  void loadImage(path) async {
    List<int> bytes = await image.readAsBytes();
    Uint8List u8lst = Uint8List.fromList(bytes);
    ui.instantiateImageCodec(u8lst).then((codec) {
      codec.getNextFrame().then((frameInfo) {
        targetimage = frameInfo.image;
        setState(() {
          createMyPainter();
        });
      });
    });
  }

  void _pointerDown(PointerDownEvent event) {
    RenderBox referenceBox = _homeStateKey.currentContext.findRenderObject();
    strokes.add([referenceBox.globalToLocal(event.position)]);
    setState(() {
      createMyPainter();
    });
  }

  void _pointerMove(PointerMoveEvent event) {
    RenderBox referenceBox = _homeStateKey.currentContext.findRenderObject();
    strokes.last.add(referenceBox.globalToLocal(event.position));
    setState(() {
      createMyPainter();
    });
  }
}

class MyPainter extends CustomPainter {
  File image;
  ui.Image targetimage;
  Size mediasize;
  Color strokecolor;

  var strokes = new List<List<Offset>>();

  MyPainter(this.targetimage, this.image, this.strokes, this.mediasize,
      this.strokecolor);

  @override
  void paint(Canvas canvas, Size size) {
    mediasize = size;
    ui.Image im = drawToCanvas();
    canvas.drawImage(im, Offset(0.0, 0.0), Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void saveImage() async {
    ui.Image img = drawToCanvas();
    final ByteData bytedata = await img.toByteData(
      format: ui.ImageByteFormat.png,
    );
    int epoch = new DateTime.now().millisecondsSinceEpoch;
    final file = new File(image.parent.path + '/' + epoch.toString() + '.png');
    file.writeAsBytes(bytedata.buffer.asUint8List());
  }

  ui.Image drawToCanvas() {
    ui.PictureRecorder recorder = ui.PictureRecorder();
    ui.Canvas canvas = Canvas(recorder);

    Paint p1 = Paint();
    p1.color = Colors.white;
    canvas.drawColor(Colors.white, BlendMode.color);

    if (targetimage != null) {
      Rect r1 = Rect.fromPoints(Offset(0.0, 0.0),
          Offset(targetimage.width.toDouble(), targetimage.height.toDouble()));
      Rect r2 = Rect.fromPoints(Offset(0.0, 0.0),
          Offset(mediasize.width.toDouble(), mediasize.height.toDouble()));
      canvas.drawImageRect(targetimage, r1, r2, p1);
    }

    Paint p2 = new Paint();
    p2.color = strokecolor;
    p2.style = PaintingStyle.stroke;
    p2.strokeWidth = 5.0;

    for (var stroke in strokes) {
      Path strokePath = new Path();
      strokePath.addPolygon(stroke, false);
      canvas.drawPath(strokePath, p2);
    }

    ui.Picture picture = recorder.endRecording();
    return picture.toImage(
        mediasize.width.toInt(), mediasize.height.toInt());
  }
}
