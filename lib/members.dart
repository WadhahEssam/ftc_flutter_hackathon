
import 'package:flutter/material.dart';

class MembersPage extends StatefulWidget {
  @override
  MembersPageState createState() => new MembersPageState();
}

class MembersPageState extends State<MembersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الاعضاء')),
      body: Center(child: Text('اعضاء النادي')),
    );
  }
}


