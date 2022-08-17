import 'package:flutter/material.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'todo app',
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
        title: Text('alışveriş listesi app'),
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
  var list = [];
  TextEditingController t1 = TextEditingController();

  add() {
    setState(() {
      list.add(t1.text);
      t1.clear();
    });
  }

  delete() {
    setState(() {
      list.remove(t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) => ListTile(
                      subtitle: Text(index.toString()),
                      title: Text(list[index]),
                    )),
          ),
          TextField(
            controller: t1,
          ),
          RaisedButton(
            onPressed: add,
            child: Text('todo ekle'),
          ),
          RaisedButton(
            onPressed: delete,
            child: Text('todo sil'),
          ),
        ],
      ),
    );
  }
}
