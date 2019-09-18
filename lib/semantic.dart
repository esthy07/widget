import 'package:flutter/material.dart';
import 'package:nan_flutter/limitedbox.dart';
import 'package:nan_flutter/reorder.dart';
import 'package:url_launcher/url_launcher.dart';

class SemanticPage extends StatefulWidget {
  final String title;
  SemanticPage({Key key, this.title}) : super(key: key);

  @override
  _SemanticPageState createState() => new _SemanticPageState();
}

class _SemanticPageState extends State<SemanticPage> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      showSemanticsDebugger: true,
      //title: Text(widget.title) ,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ReorderPage(),
    );
  }
}

