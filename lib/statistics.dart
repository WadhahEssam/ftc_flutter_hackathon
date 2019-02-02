import 'package:flutter/material.dart';

class StatisticsPage extends StatefulWidget {
  @override
  StatisticsPageState createState() => new StatisticsPageState();
}

class StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showTapBar(),
    );
  }

  Widget _showTapBar() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('احصائيات الاداء'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.group)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _showPersonalStatistics(),
            _showAllStatistics(),
          ],
        ),
      ),
    );
  }

  Widget _showPersonalStatistics() {
    return Center(child: Column(
        children: [
          Container(child: Text('الاحصائيات الشخصية', style: TextStyle(fontSize: 18)), margin: EdgeInsets.only(top: 26)),
          Container(child: Table(children: [
            TableRow(children: [
              Text("120", textAlign: TextAlign.center),
              Text("مجموع النقاط", textAlign: TextAlign.center),
            ]),
            TableRow(children:[
              Text("10", textAlign: TextAlign.center),
              Text("متوسط النقاط الاسبوعي", textAlign: TextAlign.center),
            ]),
            TableRow(children:[
              Text("84%", textAlign: TextAlign.center),
              Text("نسبة النشاط", textAlign: TextAlign.center),
            ]),
            TableRow(children:[
              Text("4", textAlign: TextAlign.center),
              Text("المركز", textAlign: TextAlign.center),
            ]),
            TableRow(children:[
              Text("8", textAlign: TextAlign.center),
              Text("الفعاليات المشترك بها", textAlign: TextAlign.center),
            ]),
            TableRow(children:[
              Text("2", textAlign: TextAlign.center),
              Text("الفعاليات التي تم انشائها", textAlign: TextAlign.center),
            ]),
          ])
            ,margin: EdgeInsets.only(top: 30, bottom: 30, right: 50, left: 20),
          ),
          Container(child: Image.asset('assets/images/personal_chart.png'), padding: EdgeInsets.all(20)),
          Container(child: Text('تحليل اداء العضو خلال الترم '))
        ]
    )
    );
  }

  Widget _showAllStatistics() {
    return Center(child: Column(
        children: [
          Container(child: Text('الاحصائيات الاجمالية', style: TextStyle(fontSize: 18)), margin: EdgeInsets.only(top: 26)),
          Container(child: Table(children: [
            TableRow(children: [
              Text("3400", textAlign: TextAlign.center),
              Text("مجموع النقاط", textAlign: TextAlign.center),
            ]),
            TableRow(children: [
              Text("71", textAlign: TextAlign.center),
              Text("عدد الاعضاء", textAlign: TextAlign.center),
            ]),
            TableRow(children:[
              Text("57", textAlign: TextAlign.center),
              Text("متوسط نقاط العضو", textAlign: TextAlign.center),
            ]),
            TableRow(children:[
              Text("91%", textAlign: TextAlign.center),
              Text("نسبة النشاط", textAlign: TextAlign.center),
            ]),
            TableRow(children:[
              Text("170", textAlign: TextAlign.center),
              Text("اعلى نقاط", textAlign: TextAlign.center),
            ]),
            TableRow(children:[
              Text("4", textAlign: TextAlign.center),
              Text("اقل نقاط", textAlign: TextAlign.center),
            ]),
            TableRow(children:[
              Text("37", textAlign: TextAlign.center),
              Text("عدد الفعاليات", textAlign: TextAlign.center),
            ]),
          ])
            ,margin: EdgeInsets.only(top: 30, bottom: 30, right: 50, left: 20),
          ),
          Container(child: Image.asset('assets/images/ftc_chart.png'), padding: EdgeInsets.all(20)),
          Container(child: Text('تحليل اداء النادي خلال الترم'))
        ]
    )
    );
  }
}
