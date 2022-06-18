import 'package:first/Student.dart';
import 'package:first/StudentUpdate.dart';
import 'package:flutter/material.dart';

import 'StudentAdd.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var ogrenciler = ['yusuf', 'unal', 'ali', 'veli'];

  List<Student> students = [
    Student.withId(1,'yusuf', 'unal', 50),
    Student.withId(2,'yusa', 'unal', 50),
    Student.withId(3,'sezai', 'unal', 55),
    Student.withId(4,'yusuf 2', 'unal', 40)
  ];

  Student selectedStudent = Student.withId(0,'', '', 0);

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
                  //leading: Icon(Icons.person),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://picsum.photos/200/300?image=${index + 1}'),
                  ),
                  title: Text(students[index].name! + ' ' + students[index].lastName!),
                  subtitle: Text("sınavdan aldıgı not: "+students[index].grade.toString() + ' ' +
                      students[index].getStatus!),
                  trailing: buildStatusIcon(students[index].grade!),
                  onTap: () {
                    // var alert = AlertDialog(
                    //     title: Text(students[index].name! + ' ' + students[index].lastName!),
                    //     content: Text('sınav notu: '+students[index].grade!.toString() + ' ' + students[index].getStatus!));
                    // showDialog(
                    //     context: context, builder: (BuilderContext) => alert);

                    setState(() {
                      selectedStudent = students[index];
                    });
                  },
                );
              }),
        ),



        Text('Seçili öğrenci: '+ selectedStudent.getName!),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                child: Row(
                  children: [
                    Icon(Icons.add),
                    Text('Yeni Öğrenci'),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StudentAdd(students)));
                },
              ),
            ),
            SizedBox(width: 5),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(width: 5), // boşluk atıypr
                    Text('Güncelle'),
                  ],
                ),
                onPressed: () {
                  print(selectedStudent.id);
                  if (selectedStudent.id != null && selectedStudent.id != 0 ) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StudentUpdate(selectedStudent)));
                  } else {
                    alert(context, 'Öğrenci Seçilmedi');
                  }
                },
              ),
            ),
            SizedBox(width: 5),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 5), // boşluk atıypr
                    Text('Sil'),
                  ],
                ),
                onPressed: () {
                  if (selectedStudent.id != null && selectedStudent.id != 0) {
                    setState(() {
                      students.remove(selectedStudent);
                    });
                    alert(context, 'Öğrenci Silindi');
                    selectedStudent = Student.withId(0,'', '', 0);
                  } else {
                    alert(context, 'Öğrenci Seçilmedi');
                  }
                  print(students);
                },
              ),
            )
          ],
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

void alert(BuildContext context, var title) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: <Widget>[
            FlatButton(
              child: Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}


// input form örneği
// TextField(
// decoration: InputDecoration(
// labelText: 'Adınız',
// hintText: 'Adınızı giriniz',
// border: OutlineInputBorder()),
// )
