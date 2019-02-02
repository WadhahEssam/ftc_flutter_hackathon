import 'package:flutter/material.dart';
import 'package:ftc_flutter_hackathon/main.dart';
import 'package:ftc_flutter_hackathon/members.dart';
import 'package:ftc_flutter_hackathon/settings.dart';

class DrawerSection extends StatefulWidget {
  @override
  DrawerSectionState createState() => new DrawerSectionState();
  final drawerItems = [
    new DrawerItem("القائمة الرئيسية", Icons.home),
   new DrawerItem("الفواتير", Icons.archive),
    new DrawerItem("الاعدادت", Icons.settings),
    new DrawerItem("تسجيل الخروج", Icons.exit_to_app),
  ];
}

class DrawerSectionState extends State<DrawerSection> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        if(context!=context)
         return Navigator.of(context).push(new MaterialPageRoute<void>(
           builder: (BuildContext context) {
             return HomePage();
           },
         ));
        break;
      case 1:
        return Navigator.of(context).push(new MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return FirstFragment();
          },
        ));

      case 2:
       return Navigator.of(context).push(new MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return SettingsPage();
          },
        ));

      case 3:
        _neverSatisfied();
        break;

      default:
        return new Text("Error");
    }
  }
  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('من جدك بتسجل خروج؟؟',textAlign: TextAlign.right),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('!!ترى إذا رحت ما راح ترجع',textAlign: TextAlign.right ,),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(' لا خلاص امزح رجعوني',),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(context); // close the drawer
    _getDrawerItemWidget(index);
  }


  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: Icon(d.icon),
        title: Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }
      return Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("أنس حسن الردادي",),
              currentAccountPicture: CircleAvatar(
                child: Image.asset('assets/images/profile_image.jpg',))
    ,
              accountEmail: Text("عضو",),
    ),
            new Column(children: drawerOptions)
          ],
        ),
      );
  }
}

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

class FirstFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("الفواتير"),
      ),
      body: Center(
        child: Text(":(ما عندك فواتير"),
      ),

    );
  }
}
