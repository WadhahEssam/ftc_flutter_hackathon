import 'package:flutter/material.dart';
import 'dart:math';

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
      new Member("عبدالعزيز الحميد", "عضو", 80, 1),
      new Member("وضاح عصام", "عضو", 80, 2),
      new Member("خالد العجلان", "رئيس لجنة", 32, 3),
      new Member("عبدالله القنية", "رئيس", 31, 4),
      new Member("محمد الجاسر", "نائب الرئيس", 27, 5),
      new Member("أسامة الفيفي", "عضو", 24, 6),
      new Member("عبادة عرابي", "رئيس لجنة", 16, 6),
      new Member("نواف القعيد", "عضو", 13, 7),
      new Member("يوسف الخليف", "عضو", 7, 8),
      new Member("عبدالرحمن القنية", "عضو", 2, 9),
    ]);
  }

  Widget buildMembers() {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider(height: 2.0, color: Colors.deepPurple);
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
    var rng = new Random();
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
      trailing: ClipRRect(child: Image.asset('assets/images/${(rng.nextInt(9)+1)}_min.jpg', width: 60, height: 60),borderRadius: new BorderRadius.all(Radius.elliptical(20, 20)), )
    );
  }
}

class Member {
  String name;
  String title;
  int score;
  int image;

  Member(this.name, this.title, this.score, this.image);
}
