
import 'package:flutter/material.dart';

class ElectionPage extends StatefulWidget {
  @override
  ElectionPageState createState() => new ElectionPageState();
}

class ElectionPageState extends State<ElectionPage> with WidgetsBindingObserver{
  int _selectedIndex = 0;
  String currentCandidatePlan = '';
  final snackBar = SnackBar(
    content: Text('Yay! A SnackBar!'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change!
      },
    ),
  );


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
              padding: const EdgeInsets.all(14.0),
              itemCount: candidateNames.length,
              itemBuilder: (BuildContext ctxt, int i) {
                return Column(children: [Container(padding: EdgeInsets.only(top: 20)),  _candidateCard(candidateNames[i], candidatePlans[i], candidateImages[i])]);
              }
          ),
        )
    );
  }

  Widget _candidateCard(String name, String plan, String image) {
    return
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Column(children: [
          Container(
            decoration: new BoxDecoration(color: Colors.deepPurple.shade200, borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
            alignment: Alignment.centerRight,
            child: Row(
                children: [
                  Container(child: Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)), padding: EdgeInsets.only(right: 20),),
                  CircleAvatar(child: ClipRRect(child: Image.asset('assets/images/${image}_min.jpg', width: 55, height: 55),borderRadius: new BorderRadius.all(Radius.elliptical(20, 20)),),)
                ],
                mainAxisAlignment: MainAxisAlignment.center),
            padding: EdgeInsets.only(top: 15, bottom:15, left: 10),
          ),
          Container(child: Column(children: <Widget>[
            Container(child: Chip(label: Text('الخطة', style: TextStyle(fontSize: 13, letterSpacing: 2))), padding: EdgeInsets.only(top: 15, bottom: 5)),
            Container(child: Text(plan, style: TextStyle(fontSize: 10, letterSpacing: 2), textDirection: TextDirection.rtl), padding: EdgeInsets.only(top: 5, bottom: 20, left: 20, right: 20)),
            Container(
              child: ButtonBar(
                  children:[
                    RaisedButton(child: Text('اسئلة الموجهة للمرشح', style: TextStyle(fontSize: 10, color: Colors.white)), onPressed: () { _pushQuestionsPage(name); }, color: Colors.deepPurple.shade300,),
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
              Chip(label: Text('انشاء الخطة', style: TextStyle(fontSize: 20))),
              TextField(keyboardType: TextInputType.multiline,maxLines: 10, onChanged: _textFieldChanged, textDirection: TextDirection.rtl,),
              Container(child: Container(), margin: EdgeInsets.only(top: 10.0)), // just a padding
              RaisedButton(
                color: Colors.green.shade400,
                child: Row(children: [
                  Container(child: Text('نشر الخطة', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)), padding: EdgeInsets.only(right: 20.0)),
                  Icon(IconData(0xe89c, fontFamily: 'MaterialIcons'), color:Colors.white),
                ], mainAxisAlignment: MainAxisAlignment.center,),
                onPressed: _submitCandidate,
                padding: EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
              )
            ],
          ),
          padding: EdgeInsets.all(20.0)),
    );
  }

  Widget _questionsView() {
    return ListView.builder(
      itemBuilder: (context, i) {
        return _questionCard(candidateQuestions[i], candidateAnswers[i]);
      },
      itemCount: candidateQuestions.length,
    );
  }

  Widget _questionCard(question, answer) {
    return Card(child:
    Column(children: [
      Container(child: Row(textDirection: TextDirection.rtl ,children: [Text(question)], mainAxisSize: MainAxisSize.max,), padding: EdgeInsets.all(12), decoration: new BoxDecoration(color: Colors.grey.shade200),),
      Container(child: Text(answer, textDirection: TextDirection.rtl ), padding: EdgeInsets.all(12)),
    ]),
    );
  }

  Widget _resultsView() {
    return Center(child:
    Column(children: [
      Container(child: Text('لم يحن موعد اعلان النتائج', style: TextStyle(fontSize: 20)), padding: EdgeInsets.all(13),),
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
              body: _questionsView(),
              floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: _seeCandidatePage,),
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
    setState(() {
      candidateNames.add('انس الردادي');
      candidateImages.add('4');
      candidatePlans.add(currentCandidatePlan);
      _selectedIndex = 0;
    });
  }

  void _seeCandidatePage() {

  }

  String _textFieldChanged(text) {
    setState(() {
      currentCandidatePlan = text;
    });
    return text;
  }

  final candidateQuestions = [
    'كيف يمكنك ان ترفع من مستوى الجودة في النادي ؟',
    'كيف يمكنك ان تصل لاعلى عدد من المتابعين في تويتر ؟',
    'كيف يمكنك ان تصل لاعلى عدد من المتابعين في تويتر ؟',
    'كيف يمكنك ان تصل لاعلى عدد من المتابعين في تويتر ؟',
  ];

  final candidateAnswers = [
    'عن طريق اثراء الترم بالفعاليات قدر الامكان و تقديم الفعاليات الاكثر فعالية بالفعل',
    'عن طريق اثراء الترم بالفعاليات قدر الامكان و تقديم الفعاليات الاكثر فعالية بالفعل',
    'عن طريق اثراء الترم بالفعاليات قدر الامكان و تقديم الفعاليات الاكثر فعالية بالفعل',
    'عن طريق النشر و الاعلان ان ان ان',
  ];

  final candidateNames = ['ابراهيم الفرحان','نواف القعيد','ناصر العواجي'];
  final candidatePlans = [
    'Make FTC Great Again Make FTC Great.',
    'أخوكم المترشح نواف القعيد، والنائب أسامة العقيلي. سنتشرح لقيادة هذا النادي العظيم الترم القادم بحول هللا.نثق بكم تمام الثقة وبأنكم العمود الفقري لهذا النادي بحكم ما شهدنا منكم وبطموحكم الغير مسبوق. ونثق بأننا بجهودكم الجبارة سنصل بالنادي الى مستوى يجعلنا فخورين بالنادي وإنجازاته التي سنحققها معكم بإذن هللا تعالى أخوكم المترشح أسامة الفيفي، والنائب أسامة العقيلي. سنتشرح لقيادة هذا النادي العظيم الترم القادم بحول هللا.نثق بكم تمام الثقة وبأنكم العمود الفقري لهذا النادي بحكم ما شهدنا منكم وبطموحكم الغير مسبوق. ونثق بأننا بجهودكم الجبارة سنصل بالنادي الى مستوى يجعلنا فخورين بالنادي وإنجازاته التي سنحققها معكم بإذن هللا تعالى أخوكم المترشح أسامة الفيفي، والنائب أسامة العقيلي. سنتشرح لقيادة هذا النادي العظيم الترم القادم بحول هللا.نثق بكم تمام الثقة وبأنكم العمود الفقري لهذا النادي بحكم ما شهدنا منكم وبطموحكم الغير مسبوق. ونثق بأننا بجهودكم الجبارة سنصل بالنادي الى مستوى يجعلنا فخورين بالنادي وإنجازاته التي سنحققها معكم بإذن هللا تعالى',
    'هلا شباب معكم دحومي ثلاث تسعات هلا شباب معكم دحومي ثلاث تسعات هلا شباب معكم دحومي ثلاث تسعات هلا شباب معكم دحومي ثلاث تسعات هلا شباب معكم دحومي ثلاث تسعات هلا شباب معكم دحومي ثلاث تسعات '
  ];
  final candidateImages = ['4', '3', '7'];

}