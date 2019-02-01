
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

  Widget _candidatesView() {
    return Center(child: Text('انتخابات النادي'));
  }

  Widget _candidatureView() {
    return Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text('انشاء الخطة', style: TextStyle(fontSize: 20)),
              TextField(keyboardType: TextInputType.multiline,maxLines: 10),
              Container(child: Container(), margin: EdgeInsets.only(top: 10.0)), // just a padding
              RaisedButton(
                child: Row(children: [
                  Container(child: Text('نشر الخطة', style: TextStyle(fontSize: 18)), padding: EdgeInsets.only(right: 20.0)),
                  Icon(IconData(0xe89c, fontFamily: 'MaterialIcons')),
                ], mainAxisAlignment: MainAxisAlignment.center,), 
                onPressed: _submitCandidate, 
                padding: EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
              )
            ],
          ), 
          padding: EdgeInsets.all(20.0)),
      );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _submitCandidate() {

  }
}
