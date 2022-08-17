import 'package:flutter/material.dart';

void main() => runApp(Calculator());

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hesap makinesi',
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(('hesap makinesi')),
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
  num sonuc = 0;

  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();

  topla() {
    setState(() {
      sonuc = int.parse(c1.text) + int.parse(c2.text);
    });
  }

  cikar() {
    setState(() {
      sonuc = int.parse(c1.text) - int.parse(c2.text);
    });
  }

  bolme() {
    setState(() {
      sonuc = int.parse(c1.text) / int.parse(c2.text);
    });
  }

  carpma() {
    setState(() {
      sonuc = int.parse(c1.text) * int.parse(c2.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('sonuc: $sonuc'),
            TextField(
              controller: c1,
            ),
            TextField(
              controller: c2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: topla,
                  child: Text('toplama'),
                ),
                RaisedButton(
                  onPressed: cikar,
                  child: Text('cıkarma'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: carpma,
                  child: Text('çarpma'),
                ),
                RaisedButton(
                  onPressed: bolme,
                  child: Text('bolme'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
