import 'package:flutter/material.dart';

class DrawerSection extends StatefulWidget {
  @override
  DrawerSectionState createState() => new DrawerSectionState();
}

class DrawerSectionState extends State<DrawerSection> {
  @override
  Widget build(BuildContext context) {
    return Drawer(child: Text('drawer'));
  }
}

