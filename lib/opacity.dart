import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OpacityPage extends StatefulWidget {
  final String title;
  OpacityPage({Key key, this.title}) : super(key: key);

  @override
  _OpacityPageState createState() => _OpacityPageState();
}

class _OpacityPageState extends State<OpacityPage> {
  bool cool = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AnimatedOpacity Example",
      home: Scaffold(
        appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.amberAccent,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.share, color: Colors.white,), onPressed: _launchURL,)
          ],),
        body: MyHomePage(visible: cool),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.flip),
          onPressed: (){
            setState(() {
              cool = !cool;
            });
          },
        ),
      ),

    );
  }
}


class MyHomePage extends StatefulWidget {
  final bool visible;

  const MyHomePage({Key key, this.visible}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        child: Container(
          child: Center(child: Text('Hello World', style: TextStyle(color: Colors.white),)),
          width: 200.0,
          height: 200.0,
          color: Colors.teal,
        ), duration: Duration(seconds: 1),
        opacity: widget.visible ? 1.0: 0.0,
      ),
    );
  }

  _launchURL() async {
    const url = 'https://github.com/esthy07/widgets/blob/master/lib/animatedswitch.dart';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

