
import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Iskele(),
    );
  }
}

class Iskele extends StatefulWidget {
  const Iskele({Key? key}) : super(key: key);

  @override
  State<Iskele> createState() => _IskeleState();
}

class _IskeleState extends State<Iskele> {
  var t1 = TextEditingController();
  var t2 = TextEditingController();

  add() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(50),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: t1,
              ),
              TextField(
                controller: t2,
              ),
              Row(
                children: [
                  RaisedButton(
                    onPressed: add,
                    child: Text('ekle'),
                  ),
                  RaisedButton(onPressed: null),
                  RaisedButton(onPressed: null),
                  RaisedButton(onPressed: null),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
