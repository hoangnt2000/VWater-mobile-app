import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class NotifiMenu extends StatefulWidget {
  @override
  _NotifiMenuState createState() => _NotifiMenuState();
}
class _NotifiMenuState extends State<NotifiMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text(
            "Thông báo 1",
            style: TextStyle(fontSize: 18, color: Color(0xff323643)),
          ),
        ),
        ListTile(
          title: Text(
            "Thông báo 2",
            style: TextStyle(fontSize: 18, color: Color(0xff323643)),
          ),
        ),
        ListTile(
          title: Text(
            "Thông báo 3",
            style: TextStyle(fontSize: 18, color: Color(0xff323643)),
          ),
        ),
        ListTile(
          title: Text(
            "Thông báo 4",
            style: TextStyle(fontSize: 18, color: Color(0xff323643)),
          ),
        ),
        ListTile(
          title: Text(
            "Thông báo 5",
            style: TextStyle(fontSize: 18, color: Color(0xff323643)),
          ),
        ),
      ],
    );
  }



}
