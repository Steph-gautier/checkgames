import 'package:flutter/material.dart';

class ScoreView extends StatefulWidget {
  @override
  _ScoreViewState createState() => _ScoreViewState();
}

class _ScoreViewState extends State<ScoreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Games"),
      ),
    );
  }
}
