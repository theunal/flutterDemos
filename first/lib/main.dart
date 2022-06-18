import 'package:first/Student.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  var ogrenciler = ['yusuf', 'unal', 'ali', 'veli'];
  List<Student> students = [
    Student('yusuf', 'unal', 50),
    Student('yusa', 'unal', 50),
    Student('sezai', 'unal', 55),
    Student('yusuf 2', 'unal', 40)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('my first app')),
        body: buildBody(context)


    );
  }

  String sinavHesapla(int puan) {
    if (puan >= 50) {
      return 'GEÇTİ';
    } else {
      return 'KALDI';
    }
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
               // return Text(students[index].name!);
                return ListTile(
                  title: Text(students[index].name! + ' ' + students[index].lastName!),
                  subtitle: Text("sınavdan aldıgı not: "+students[index].grade.toString() + ' ' +
                      sinavHesapla(students[index].grade!)),
                  trailing: buildStatusIcon(students[index].grade!),
                );
              }),

        ),
        Center(
            child: RaisedButton(
              color: Colors.blue,
              child: Text('sonucu gör'),
              onPressed: () {
                var alert = AlertDialog(
                    title: Text('sınav sonucu'),
                    content: Text(sinavHesapla(50)));
                showDialog(
                    context: context, builder: (BuilderContext) => alert);
              },
            ))
      ],
    );
  }

  buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.check, color: Colors.green);
    } else {
      return Icon(Icons.close, color: Colors.red);
    }
  }
}
