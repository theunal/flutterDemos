import 'package:flutter/material.dart';

class MessageApp extends StatelessWidget {
  const MessageApp({Key? key}) : super(key: key);

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
  var t1 = TextEditingController();

  List<MessagePopUp> list = [];

  add(String message) {
    var popUp = MessagePopUp(message);
    setState(() {
      list.insert(0, popUp);
    });
    t1.clear();
  }

  Widget InputText() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: t1,
            ),
          ),
          IconButton(
            onPressed: () => add(t1.text),
            icon: Icon(Icons.send),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: list.length,
              itemBuilder: (_, index) => Card(
                margin: EdgeInsets.all(10),
                child: list[index],
              ),
            ),
          ),
          Divider(),
          InputText()
        ],
      ),
    );
  }
}

String isim = 'Kullanıcı 1';

class MessagePopUp extends StatelessWidget {
  String message = '';

  MessagePopUp(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            child: Text(isim[0]),
          ),
          Column(
            children: [
              Text(isim),
              Text(message),
            ],
          )
        ],
      ),
    );
  }
}
