import 'package:flutter/material.dart';

import 'animatedswitch.dart';
import 'animtedIcon.dart';
import 'aspectratio.dart';
import 'constrainedbox.dart';
import 'flexible.dart';
import 'index.dart';
import 'limitedbox.dart';
import 'listed.dart';
import 'mediaquery.dart';
import 'opacity.dart';
import 'padding.dart';
import 'placeholder.dart';
import 'reorder.dart';
import 'richtext.dart';
import 'spacer.dart';
import 'stack.dart';
import 'draggable.dart';
import 'semantic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'EsthyNan'),
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

  List<Widget> arrWid = [
    SwitchPage(title: "AnimatedSwitch"),
    AnimatedIconPage(title: "AnimatedIcon"),
    AspectRatioPage(title: "AspectRatio"),
    ConstrainedPage(title: "ConstrainedBox"),
    FlexiblePage(title: "Flexible"),
    IndexPage(title: "IndexStack"),
    LimitedBoxPage(title: "LimitedBox"),
    ListedPage(title: "AnimatedList"),
    MediaQueryPage(title: "Mediaquery"),
    OpacityPage(title: "AnimatedOpacity"),
    AnimatedPad(title: "AnimatedPadding"),
    PlaceholderPage(title: "Placeholder"),
    ReorderPage(title: "ReorderListView"),
    RichTextPage(title: "RichText"),
    SpacerPage(title: "Spacer"),
    StackPage(title: "Stack"),
    DragPage(title: "Draggable"),
    SemanticPage(title: "Semantics"),
  ];

  List<String> arrText = [
    "AnimatedSwitch",
    "AnimatedIcon",
    "AspectRatio",
    "ConstrainedBox",
    "Flexible",
    "IndexStack",
    "LimitedBox",
    "AnimatedList",
    "Mediaquery",
    "AnimatedOpacity",
    "AnimatedPadding",
    "Placeholder",
    "ReorderListView",
    "RichText",
    "Spacer",
    "Stack",
    "Draggable",
    "Semantics"
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: arrText.length,
            itemBuilder: (context, i) {
            return RaisedButton(onPressed: () {
              toNewPage(arrWid[i]);
            },
            child: Text(arrText[i]),);

            }
        ),
      ),
    );
  }

  void toNewPage(Widget wid) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return wid;
    }));
  }
}
