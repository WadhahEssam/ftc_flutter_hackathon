
import 'package:flutter/material.dart';

class ElectionPage extends StatefulWidget {
  @override
  ElectionPageState createState() => new ElectionPageState();
}

class ElectionPageState extends State<ElectionPage> with WidgetsBindingObserver{
  int _selectedIndex = 0;
  String currentCandidatePlan = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('انتخابات النادي')),
      body: (_selectedIndex == 0) ? _candidatesView() : ((_selectedIndex == 1) ? _candidatureView() : _resultsView())  ,
      bottomNavigationBar: BottomNavigationBar(
       items: <BottomNavigationBarItem>[
         BottomNavigationBarItem(icon: Icon(IconData(0xe8d3, fontFamily: 'MaterialIcons')), title: Text('المرشحين')),
         BottomNavigationBarItem(icon: Icon(IconData(0xe3bb, fontFamily: 'MaterialIcons')), title: Text('الترشح')),
         BottomNavigationBarItem(icon: Icon(IconData(0xe8d0, fontFamily: 'MaterialIcons')), title: Text('النتائج')),
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
            decoration: new BoxDecoration(color: Colors.grey.shade200),
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
            Container(child: Text('الخطة', style: TextStyle(fontSize: 13)), padding: EdgeInsets.only(top: 10)),
            Container(child: Text(plan, style: TextStyle(fontSize: 10), textDirection: TextDirection.rtl), padding: EdgeInsets.only(top: 5, bottom: 20, left: 20, right: 20)),
            Container(
              child: ButtonBar(
                children:[
                  RaisedButton(child: Text('اسئلة الاعضاء', style: TextStyle(fontSize: 10, color: Colors.white)), onPressed: () { _pushQuestionsPage(name); }, color: Colors.deepPurple.shade300,), 
                  RaisedButton(child: Text('تصويت', style: TextStyle(fontSize: 10, color: Colors.white)), onPressed: _seeCandidatePage, color: Colors.green.shade400,), 
                ],
                mainAxisSize: MainAxisSize.max,
                alignment: MainAxisAlignment.center
                ),
              margin: EdgeInsets.only(bottom: 10), 
            )
          ])) 
        ]),
        
      );
  }

  Widget _candidatureView() {
    return Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('انشاء الخطة', style: TextStyle(fontSize: 20)),
              TextField(keyboardType: TextInputType.multiline,maxLines: 10, onChanged: _textFieldChanged, textDirection: TextDirection.rtl,),
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

  Widget _resultsView() {
    return Center(child: 
        Column(children: [
          Container(child: Text('لم يحن موعد اعلان النتائج', style: TextStyle(fontSize: 20),), padding: EdgeInsets.all(13),),
          Icon(Icons.error_outline, size: 30,)
        ], mainAxisAlignment: MainAxisAlignment.center,)
    );
  }

  void _pushQuestionsPage(name) {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return new Scaffold(
            appBar: AppBar(title: Text('اسئلة ${name}')),
            body: Center(child: Text('اسئلة')),
          );
        },
      )
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _submitCandidate() {
    candidateNames.add('نواف القعيد');
    candidateImages.add('4');
    candidatePlans.add(currentCandidatePlan);
  }

  void _seeCandidatePage() {
    
  }

  String _textFieldChanged(text) {
    setState(() {
      currentCandidatePlan = text;
    });
    return text;
  }

  final candidateNames = ['اسامة الفيفي', 'ابراهيم الفرحان', 'عبدالرحمن السنيدي'];
  final candidatePlans = [
    'يعود بالضرر على الشركة والنادي يكون فيه متابعة مع تطورات النادي من ضيوف ومن مشاركات بحيث انه يتم التأكد من عدم مساس سياسة الدولة او سياسة الجامعة بما اذا كان المقصود بالسلطة انه يتم التحكم بقرارت النادي وش نسوي وايش ما نسوي فأكيد ال وانا بكون ضد هذا الشيء، بس بالطبع يعود بالضرر على الشركة والنادي يكون فيه متابعة مع تطورات النادي من ضيوف ومن مشاركات بحيث انه يتم التأكد من عدم مساس سياسة الدولة او سياسة الجامعة بما اذا كان المقصود بالسلطة انه يتم التحكم بقرارت النادي وش نسوي وايش ما نسوي فأكيد ال وانا بكون ضد هذا الشيء، بس بالطبع يعود بالضرر على الشركة والنادي يكون فيه متابعة مع تطورات النادي من ضيوف ومن مشاركات بحيث انه يتم التأكد من عدم مساس سياسة الدولة او سياسة الجامعة بما اذا كان المقصود بالسلطة انه يتم التحكم بقرارت النادي وش نسوي وايش ما نسوي فأكيد ال وانا بكون ضد هذا الشيء، بس بالطبع', 
    'Make FTC Great Again Make FTC Great Again Make FTC Great Again Make FTC Great Again Make FTC Great Again Make FTC Great Again Make FTC Great Again ', 
    'هلا شباب معكم دحومي ثلاث تسعات هلا شباب معكم دحومي ثلاث تسعات هلا شباب معكم دحومي ثلاث تسعات هلا شباب معكم دحومي ثلاث تسعات هلا شباب معكم دحومي ثلاث تسعات هلا شباب معكم دحومي ثلاث تسعات '
    ];
  final candidateImages = ['1', '2', '3'];

}
