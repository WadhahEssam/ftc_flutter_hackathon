import 'package:flutter/material.dart';
import 'election.dart';
import 'members.dart';
import 'statistics.dart';
import 'drawer.dart';
import 'dart:async';
import 'dart:math';
import 'settings.dart';
import 'suggestion.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Cairo', primarySwatch: Colors.deepPurple, brightness: Brightness.light),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String caff = '75%';

  @override
  Widget build(BuildContext context) {
    const oneSec = const Duration(seconds:1);
    bool isRunning = false;
    new Timer.periodic(oneSec, (Timer t) {
      if (!isRunning) {
        var rng = new Random();
        setState(() {
          caff = '${rng.nextInt(15)+60
          }%';
          isRunning = true;
        });
      }
    });

    return Scaffold(
      endDrawer: DrawerSection(),
      appBar: AppBar(
        title: Text('نادي تقنية المستقبل'),
      ),
      body: _buildMainButtons(),
    );
  }

  void _showDrawer() {
    print('drawer supposed to be viwed');
  }

  Widget _buildMainButtons() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20.0),
      crossAxisSpacing: 10.0,
      crossAxisCount: 2,
      children: <Widget>[
        _homeButton(title: 'الانتخابات', index: 1, icon: 0xe168, color: Colors.deepPurple[200]),
        _homeButton(title: 'الاعضاء', index: 2, icon: 0xe7ef, color: Colors.green[300]),
        _homeButton(title: 'الفعاليات', index: 3, icon: 0xe164, color: Colors.blueAccent[200]),
        _homeButton(title: 'احصائيات', index: 4, icon: 0xe85c, color: Colors.orangeAccent[200]),
        _homeButton(title: 'مجموعتي', index: 5, icon: 0xe939, color: Colors.redAccent[100]),
        _homeButton(title: 'الاقتراحات', index: 6, icon: 0xe266, color: Colors.teal[300]),
        _homeButton(title: 'الاعدادات', index: 7, icon: 0xe8b8, color: Colors.blueGrey),
        _homeButton1(title:'نسبة الكافيين', index: 8),
      ],
    );
  }

  Widget _homeButton({title, index, icon, color}) {
    return Container(
      child: RaisedButton(
          color: color,
          onPressed: () => _homeRouter(index),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  IconData(icon, fontFamily: 'MaterialIcons'),
                  color: Colors.white,
                  size: 40.0,
                ),
                Container(
                    child: Text(title, style: TextStyle(fontSize: 18, color: Colors.white)),
                    margin: EdgeInsets.only(top: 10.0))
              ])),
      margin: EdgeInsets.only(top: 10.0),
    );
  }

  Widget _homeButton1({title, index}) {
    return Container(
      child: RaisedButton(
          color: Colors.brown.shade400,
          onPressed: () => _homeRouter(index),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('${caff}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))
                ,
                Container(
                    child: Text(title, style: TextStyle(fontSize: 18, color: Colors.white)),
                    margin: EdgeInsets.only(top: 10.0))
              ])),
      margin: EdgeInsets.only(top: 10.0),
    );
  }
  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favorite'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
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
      case 8:
        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text("Sending Message"),
        ));
        return;
      case 6:
        _goToSuggestionPage();
            return;
      case 7:
        _goToSettingsPage();
        return;
    }
  }

  void _goToStatisticsPage() {
    Navigator.of(context).push(new MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return StatisticsPage();
      },
    ));
  }
  void _goToSuggestionPage() {
    Navigator.of(context).push(new MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return SuggestionPage();
      },
    ));
  }

  void _goToElectionPage() {
    Navigator.of(context).push(new MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return ElectionPage();
      },
    ));
  }

  void _goToMembersPage() {
    Navigator.of(context).push(new MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return MembersPage();
      },
    ));
  }

  void _goToSettingsPage() {
    Navigator.of(context).push(new MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return SettingsPage();
      },
    ));
  }
}