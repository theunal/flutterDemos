import 'package:first/StudentValidator.dart';
import 'package:flutter/material.dart';

import 'Student.dart';

class StudentUpdate extends StatefulWidget {
  Student? student;

  StudentUpdate(Student student) {
    this.student = student;
  }

  @override
  State<StatefulWidget> createState() {
    return _StudentUpdateState(student!);
  }
}

class _StudentUpdateState extends State with StudentValidator {
  Student? student;
  var formKey = GlobalKey<FormState>();

  _StudentUpdateState(Student student) {
    this.student = student;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Öğrenci Güncelle'),
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
      initialValue: student!.name,
        validator: validateName,
        decoration: InputDecoration(
            labelText: 'Ad',
            hintText: 'Ad giriniz',
            border: OutlineInputBorder()),
        onSaved: (String? value) {
          student?.name = value;
        });
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue: student?.lastName,
        validator: validateLastName,
        decoration: InputDecoration(
            labelText: 'Soyad',
            hintText: 'Soyad giriniz',
            border: OutlineInputBorder()),
        onSaved: (String? value) {
          student?.lastName = value;
        });
  }

  Widget buildGradeField() {
    return TextFormField(
      initialValue: student?.grade?.toString(),
        validator: validateGrade,
        decoration: InputDecoration(
            labelText: 'Puan',
            hintText: 'Puan giriniz',
            border: OutlineInputBorder()),
        onSaved: (String? value) {
          student?.grade = int.parse(value!);
        });
  }

  Widget buildSaveButton(BuildContext context) {
    return RaisedButton(
      child: Text('Ekle'),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          Navigator.of(context).pop(student);
        }
      },
    );
  }
}
