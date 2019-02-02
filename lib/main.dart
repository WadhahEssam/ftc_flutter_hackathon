import 'package:flutter/material.dart';
import 'election.dart';
import 'members.dart';
import 'statistics.dart';
import 'drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Cairo', primarySwatch: Colors.deepPurple),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();  
}

class HomePageState extends State<HomePage> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerSection(),
      appBar: AppBar(
        title: Text('نادي تقنية المستقبل', style: TextStyle(fontFamily: 'Cairo'),),
      ),
      body: _buildMainButtons(),
    );
  }

  _showDrawer() {
    print('drawer supposed to be viwed');
  }

  Widget _buildMainButtons() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20.0),
      crossAxisSpacing: 10.0,
      crossAxisCount: 2,
      children: <Widget>[
        _homeButton(title: 'الانتخابات', index: 1, icon: 0xe168),
        _homeButton(title: 'الاعضاء', index: 2, icon: 0xe7ef),
        _homeButton(title: 'الفعاليات', index: 3, icon: 0xe164),
        _homeButton(title: 'احصائيات', index: 4, icon: 0xe85c),
        _homeButton(title: 'مجموعتي', index: 5, icon: 0xe939),
        _homeButton(title: 'الاعدادات', index: 6, icon: 0xe8b8),
      ],
    );
  }

  Widget _homeButton({title, index, icon}) {
    return Container(
      child: RaisedButton(
        onPressed: () => _homeRouter(index), 
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: <Widget>[
                Icon(IconData(icon, fontFamily: 'MaterialIcons'), size: 40.0,) , 
                Container(child: Text(title, style: TextStyle(fontSize: 18)), margin: EdgeInsets.only(top: 10.0))
              ])
          ), 
        margin: EdgeInsets.only(top: 10.0),
      );
  }

  void _homeRouter(index) {
    print(index);
    switch (index) {
      case 1: 
        _goToElectionPage();
        return;
      case 2: 
        _goToMembersPage();
        return;
      case 4: 
        _goToStatisticsPage();
        return;
    }
  }

  void _goToStatisticsPage() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {    
          return StatisticsPage();
        },
      )
    );
  }

  void _goToElectionPage() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {    
          return ElectionPage();
        },
      )
    );
  }

  void _goToMembersPage() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {    
          return MembersPage();
        },
      )
    );
  }
}

