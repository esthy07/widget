import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListedPage extends StatefulWidget {
  final String title;
  ListedPage({Key key, this.title}) : super(key: key);

  @override
  ListedPageState createState() {
    return new ListedPageState();
  }
}
class ListedPageState extends State<ListedPage> {
  // the GlobalKey is needed to animate the list
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  // backing data
  List<String> _data = ['opprtune', 'eunice', 'Cosette', 'colombe', 'lamia'];
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 400,
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _data.length,
              itemBuilder: (context, index, animation) {
                return _buildItem(_data[index], animation);
              },
            ),
          ),
          RaisedButton(
            color: Colors.teal,
            child: Text(
              'Ajouter',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              _onButtonPress();
            },
          )
        ],
      ),
    );
  }
  Widget _buildItem(String item, Animation animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        child: ListTile(
          title: Text(
            item,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
  void _onButtonPress() {
    // replace this with method choice below
    _insertSingleItem();
  }
  void _insertSingleItem() {
    String item = "esthy";
    int insertIndex = 2;
    _data.insert(insertIndex, item);
    _listKey.currentState.insertItem(insertIndex);
  }
  void _insertMultipleItems() {
    final items = ['Pig', 'Chichen', 'Dog'];
    int insertIndex = 2;
    _data.insertAll(insertIndex, items);
    // This is a bit of a hack because currentState doesn't have
    // an insertAll() method.
    for (int offset = 0; offset < items.length; offset++) {
      _listKey.currentState.insertItem(insertIndex + offset);
    }
  }
  void _removeSingleItems() {
    int removeIndex = 2;
    String removedItem = _data.removeAt(removeIndex);
    // This builder is just so that the animation has something
    // to work with before it disappears from view since the
    // original has already been deleted.
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      // A method to build the Card widget.
      return _buildItem(removedItem, animation);
    };
    _listKey.currentState.removeItem(removeIndex, builder);
  }
  void _removeMultipleItems() {
    int removeIndex = 2;
    int count = 2;
    for (int i = 0; i < count; i++) {
      String removedItem = _data.removeAt(removeIndex);
      AnimatedListRemovedItemBuilder builder = (context, animation) {
        return _buildItem(removedItem, animation);
      };
      _listKey.currentState.removeItem(removeIndex, builder);
    }
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