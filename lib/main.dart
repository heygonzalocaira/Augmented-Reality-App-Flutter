import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ArCoreController arCoreController;
  _onArCoreViewCreated(ArCoreController _arcoreController){
    arCoreController = _arcoreController;
    _addSphere(arCoreController);
  }
  _addSphere(ArCoreController _arcoreController){
    final material = ArCoreMaterial(color: Colors.deepOrange);
    final sphere = ArCoreSphere(materials: [material],radius:0.2);
    final node = ArCoreNode(shape : sphere, position : vector.Vector3(0,0,-1),);

    _arcoreController.addArCoreNode(node);
  }
  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ArCoreView(onArCoreViewCreated: _onArCoreViewCreated),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

