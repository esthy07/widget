import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimatedIconPage extends StatefulWidget {
  final String title;
  AnimatedIconPage({Key key, this.title}) : super(key: key);

  @override
  _AnimatedIconPageState createState() => _AnimatedIconPageState();
}

class _AnimatedIconPageState extends State<AnimatedIconPage> with SingleTickerProviderStateMixin{

 AnimationController _controller;

 @override
 void initState() {
   super.initState();
   _controller = AnimationController(
     duration: Duration(milliseconds: 300),
     value: 1.0,
     vsync: this
   );
 }

 @override
 void dispose() {
   _controller.dispose();
   super.dispose();
 }

 bool get _status {
   final AnimationStatus status = _controller.status;
   return status == AnimationStatus.completed ||
   status == AnimationStatus.forward;
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('animatedIcon'),
        backgroundColor: Colors.amberAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share, color: Colors.white,), onPressed: _launchURL,)
        ],
      ),
      body: ListView(
        children: <Widget>[
          getAnimatedIcon(AnimatedIcons.add_event, "Event to Add"),
          getAnimatedIcon(AnimatedIcons.play_pause, "Event to Add"),
          getAnimatedIcon(AnimatedIcons.arrow_menu, "Event to Add"),
          getAnimatedIcon(AnimatedIcons.ellipsis_search, "Event to Add"),
          getAnimatedIcon(AnimatedIcons.close_menu, "Event to Add"),
          getAnimatedIcon(AnimatedIcons.home_menu, "Event to Add"),
        ],
      ),
    );
  }

  getAnimatedIcon(AnimatedIconData iconData, String title) {
   return Padding(
       padding: EdgeInsets.all(8.0),
     child: InkWell(
       child: Row(
         children: <Widget>[
           IconButton(
               icon: AnimatedIcon(icon: iconData, progress: _controller.view),
               onPressed: () {
                 _controller.fling(velocity: _status ? -2.0 : 2.0);
               }
           ),
           Text('lala'),
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
