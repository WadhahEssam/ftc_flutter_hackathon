
import 'package:flutter/material.dart';

class ElectionPage extends StatefulWidget {
  @override
  ElectionPageState createState() => new ElectionPageState();
}

class ElectionPageState extends State<ElectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('انتخابات النادي')),
      body: Center(child: Text('انتخابات النادي')),
    );
  }
}


