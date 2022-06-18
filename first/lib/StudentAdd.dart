import 'package:first/StudentValidator.dart';
import 'package:flutter/material.dart';

import 'Student.dart';

class StudentAdd extends StatefulWidget {
  List<Student>? students;
  StudentAdd(List<Student>? students) {
    this.students = students;
  }

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students!);
  }
}

class _StudentAddState extends State with StudentValidator {
  List<Student>? students;
  Student student = Student.withId(0,'', '', 0);
  var formKey = GlobalKey<FormState>();

  _StudentAddState(List<Student> students) {
    this.students = students;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Öğrenci Ekle'),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          // margin: EdgeInsets.only(bottom: 20), sadece alt kısmını ayarlar
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                buildNameField(),
                SizedBox(height: 20),
                buildLastNameField(),
                SizedBox(height: 20),
                buildGradeField(),
                SizedBox(height: 20),
                buildSaveButton(context),
              ],
            ),
          ),
        ));
  }

  Widget buildNameField() {
    return TextFormField(
        validator: validateName,
        decoration: InputDecoration(
            labelText: 'Ad',
            hintText: 'Ad giriniz',
            border: OutlineInputBorder()),
        onSaved: (String? value) {
          student.name = value;
        });
  }

  Widget buildLastNameField() {
    return TextFormField(
        validator: validateLastName,
        decoration: InputDecoration(
            labelText: 'Soyad',
            hintText: 'Soyad giriniz',
            border: OutlineInputBorder()),
        onSaved: (String? value) {
          student.lastName = value;
        });
  }

  Widget buildGradeField() {
    return TextFormField(
        validator: validateGrade,
        decoration: InputDecoration(
            labelText: 'Puan',
            hintText: 'Puan giriniz',
            border: OutlineInputBorder()),
        onSaved: (String? value) {
          student.grade = int.parse(value!);
        });
  }

  Widget buildSaveButton(BuildContext context) {
    return RaisedButton(
      child: Text('Ekle'),
      onPressed: () {
        // Navigator.pop(context);  pop ile önceki sayfaya geri dönülür
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          student.id = students!.length + 1;

          print(students?.length);
          setState(() {
            students?.add(student);
          });
        //  students?.add(student);
         // Navigator.pop(context);
        }
      },
    );
  }
}
