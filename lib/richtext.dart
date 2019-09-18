import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RichTextPage extends StatelessWidget {
  final String title;
  RichTextPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widget;
    return Scaffold(
      appBar: AppBar(
        title: Text("RichText"),
        backgroundColor: Colors.amberAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share, color: Colors.white,), onPressed: _launchURL,)
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.black87,
              width: 300,
              height: 300,
              child: RichText(text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan> [
                  TextSpan(text: 'jaime', style: TextStyle(color: Colors.amber, fontSize: 20)),
                  TextSpan(text: 'manger', style: TextStyle(color: Colors.white, fontSize: 20)),
                  TextSpan(text: 'avec', style: TextStyle(color: Colors.red, fontSize: 20)),
                  TextSpan(text: 'mes amis', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 20))
                ]
              )),
            )
          ],
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
