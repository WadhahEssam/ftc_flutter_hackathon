
import 'package:flutter/material.dart';

class ElectionPage extends StatefulWidget {
  @override
  ElectionPageState createState() => new ElectionPageState();
}

class ElectionPageState extends State<ElectionPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('انتخابات النادي')),
      body: (_selectedIndex == 0) ? _candidatesView() : _candidatureView(),
      bottomNavigationBar: BottomNavigationBar(
       items: <BottomNavigationBarItem>[
         BottomNavigationBarItem(icon: Icon(IconData(0xe8d3, fontFamily: 'MaterialIcons')), title: Text('المرشحين')),
         BottomNavigationBarItem(icon: Icon(IconData(0xe3bb, fontFamily: 'MaterialIcons')), title: Text('الترشح')),
       ],
       currentIndex: _selectedIndex,
       fixedColor: Colors.deepPurple,
       onTap: _onItemTapped,
     ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _candidatesView() {
    return Center(child: Text('انتخابات النادي'));
  }

  Widget _candidatureView() {
    return Center(child: Text('الترشح لرئاسة النادي'));
  }
}
