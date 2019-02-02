import 'package:flutter/material.dart';

class SuggestionPage extends StatefulWidget {
  @override
  SuggestionPageState createState() => new SuggestionPageState();
}

class SuggestionPageState extends State<SuggestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الاقتراحات')),
      body: _suggestionMenu(),
    );
  }

  Widget _suggestionMenu() {
    Column(children: <Widget>[
      TextField(
        decoration: InputDecoration(
            border: InputBorder.none, hintText: 'Please enter a search term'),
      )
    ]);
  }
}
