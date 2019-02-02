import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  SettingsPageState createState() => new SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الاعدادات')),
      body: _settingsMenu(),
    );
  }

  Widget _settingsMenu() {
    return Center(child: Text('الاعدادات'));
  }
}

