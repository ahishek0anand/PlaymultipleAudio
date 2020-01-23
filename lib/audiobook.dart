import 'package:flutter/material.dart';
import 'player_widget.dart';

class Audiobook extends StatefulWidget {
  Audiobook({Key key}) : super(key: key);

  @override
  _AudiobookState createState() => _AudiobookState();
}

class _AudiobookState extends State<Audiobook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Oneaudio(sound: "ocean.mp3"),
        Oneaudio(sound: "rain.mp3"),
        Oneaudio(sound: "sunset.mp3"),
      ],),

    );
  }
}