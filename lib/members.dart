import 'package:flutter/material.dart';

class MembersPage extends StatefulWidget {
  @override
  MembersPageState createState() => new MembersPageState();
}

class MembersPageState extends State<MembersPage> {
  final names = <Member>[];
  final nameStyle = const TextStyle(fontSize: 22.0);
  final titleStyle = const TextStyle(fontSize: 12, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    this.fillArray();
    return Scaffold(
      appBar: AppBar(title: Text('الاعضاء')),
      body: buildMembers(),
    );
  }

  void fillArray() {
    names.addAll([
      new Member("أنس", "عضو", 80),
      new Member("وضاح", "عضو", 80),
      new Member("خالد", "رئيس لجنة", 32),
      new Member("عبدالله", "رئيس", 31),
      new Member("محمد", "نائب الرئيس", 27),
      new Member("أسامة", "عضو", 24),
      new Member("عبادة", "عضو", 16),
      new Member("نواف", "عضو", 13),
      new Member("يوسف", "عضو", 7),
      new Member("عبدالرحمن", "عضو", 2),
    ]);
  }

  Widget buildMembers() {
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider(height: 16.0);
        final index = i ~/ 2;
        if (index > names.length) {
          return Container(child: Text(''));
        }
        return _buildRow(names[index]);
      },
      itemCount: 20,
    );
  }

  Transform order(Member m, int i){
    return Transform(
      transform: new Matrix4.identity()..scale(0.9),
      child: Chip(
        backgroundColor: getColor(m),
        label: Text(
          m.title,
          style: titleStyle,
        ),
      )
    );
  }

  Color getColor(Member m)
  {
    switch(m.title){
      case "عضو":
        return Colors.indigoAccent;
        break;
      case "رئيس لجنة":
        return Colors.lightGreen;
        break;
      case "رئيس":
        return Colors.red.shade900;
        break;
      case "نائب الرئيس":
        return Colors.red.shade400;
        break;
    }

  }
  Widget _buildRow(Member m) {
    return ListTile(
      title: Container(
        child: Text(m.name, style: nameStyle),
        alignment: Alignment.centerRight,
      ),
      subtitle: Container(
          alignment: Alignment.centerRight,
          child: order(m,0),
      ),
      leading: Text(
        m.score.toString(),
        style: nameStyle,
      ),
      trailing: CircleAvatar(
        child: Image.asset('assets/images/profile_image.jpg'),
      ),
    );
  }
}

class Member {
  String name;
  String title;
  int score;

  Member(this.name, this.title, this.score);
}
