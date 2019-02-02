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
      ),
    );
  }
}

