import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SwitchPage extends StatefulWidget {
  final String title;
  SwitchPage({Key key, this.title}) : super(key: key);

  @override
  _SwitchPageState createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {

  bool isVrai = true;

  static bool canUpdate(Widget oldWidget, Widget newWidget) {
    return oldWidget.runtimeType == newWidget.runtimeType
        && oldWidget.key == newWidget.key;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.amberAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share, color: Colors.white,), onPressed: _launchURL,)
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          isVrai = !isVrai;
        });
      }) ,
      body: Center(
        child: AnimatedSwitcher(
          child: isVrai
            ? Container(
            key: UniqueKey(),
            height: 300.0,
            width: 300.0,
            color: Colors.amber,
          )
          : Text(
            'Miss NaN', style: TextStyle(
            color: Colors.teal,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
          ),
            duration: Duration(seconds: 2)
        ),
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
