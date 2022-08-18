import 'package:flutter/material.dart';

import 'messageApp2.dart';

void main() => runApp(MessageApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'message app',
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('message app'),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();
  List messageList = [];

  addMessage() {
    setState(() {
      messageList.insert(0, t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        children: [
          Flexible(
              child: ListView.builder(
                  reverse: true,
                  itemCount: messageList.length,
                  itemBuilder: (context, index) => ListTile(
                        title: Text(messageList[index]),
                      ))),
          Row(
            children: [
              Flexible(
                child: TextField(
                  controller: t1,
                ),
              ),
              RaisedButton(
                onPressed: addMessage,
                child: Text('ekle'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
