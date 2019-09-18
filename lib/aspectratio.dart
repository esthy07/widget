import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AspectRatioPage extends StatelessWidget {
  final String title;
  AspectRatioPage({Key key, this.title}) : super(key: key);

  //A widget that attempts to size the child to a specific aspect ratio.
  @override
  Widget build(BuildContext context) {
    var widget = AspectRatio;
    return Scaffold(
      appBar: AppBar(
          title: Text("AspectRatio"),
          backgroundColor: Colors.amberAccent,
          actions: <Widget>[
          IconButton(icon: Icon(Icons.share, color: Colors.white,), onPressed: _launchURL,)
        ],),
      body: Center(
        child: AspectRatio(
          aspectRatio: 5,
          child: Container(height: 50.0, width: 50.0, color: Colors.red),
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