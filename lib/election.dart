
import 'package:flutter/material.dart';

class ElectionPage extends StatefulWidget {
  @override
  ElectionPageState createState() => new ElectionPageState();
}

class ElectionPageState extends State<ElectionPage> with WidgetsBindingObserver{
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
    return Center(
      child: Container(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: candidateNames.length,
          itemBuilder: (BuildContext ctxt, int i) {
            return _candidateCard(candidateNames[i], candidatePlans[i], candidateImages[i]);
          }
        ),
      )
    );
  }

  Widget _candidateCard(String name, String plan, String image) {
    return 
      Card(
        child: Column(children: [
          Container(
            alignment: Alignment.centerRight,
            child: Row(
              children: [
                Container(child: Text(name), padding: EdgeInsets.only(right: 20),),
                CircleAvatar(child: Image.asset('assets/images/profile_image.jpg'), backgroundColor: Colors.brown.shade800,),
                // RaisedButton(child: Text('اسئلة المرشح'), onPressed: _seeCandidatePage)
              ], 
              mainAxisAlignment: MainAxisAlignment.end), 
            padding: EdgeInsets.all(15),
          ),
          Container(child: Column(children: <Widget>[
            Text('الخطة', style: TextStyle(fontSize: 13)),
            Container(child: Text(plan, style: TextStyle(fontSize: 10)), padding: EdgeInsets.all(20)),
            Container(
              child: RaisedButton(child: Text('التصويت', style: TextStyle(fontSize: 10, color: Colors.white)), onPressed: _seeCandidatePage, color: Theme.of(context).accentColor,),
              margin: EdgeInsets.only(bottom: 10), 
            )
          ])) 
        ])
      );
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

  void _seeCandidatePage() {
    
  }


  final candidateNames = ['اسامة الفيفي', 'ابراهيم الفرحان', 'عبدالرحمن السنيدي'];
  final candidatePlans = [
    'خطة اسامة الفيفي خطة اسامة الفيفي خطة اسامة الفيفي خطة اسامة الفيفي خطة اسامة الفيفي خطة اسامة الفيفي خطة اسامة الفيفي', 
    'Make FTC Great Again Make FTC Great Again Make FTC Great Again Make FTC Great Again Make FTC Great Again Make FTC Great Again Make FTC Great Again ', 
    'هلا شباب معكم دحومي ثلاث تسعات هلا شباب معكم دحومي ثلاث تسعات هلا شباب معكم دحومي ثلاث تسعات هلا شباب معكم دحومي ثلاث تسعات هلا شباب معكم دحومي ثلاث تسعات هلا شباب معكم دحومي ثلاث تسعات '
    ];
  final candidateImages = ['1', '2', '3'];

}

class Candidate {
  String name;
  String plan;
  int image;

  Candidate(name, plan, image);

  String getName() {
    return name;
  }
}