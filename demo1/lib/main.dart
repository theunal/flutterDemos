import 'package:demo1/calculator.dart';
import 'package:flutter/material.dart';

void main() => runApp(Calculator());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo app 1',
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('blog uygulamasi'),
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
  String blogText = 'deneme blog text';

  martText() {
    setState(() {
      blogText = 'mart';
    });
  }

  nisanText() {
    setState(() {
      blogText = 'nisan';
    });
  }

  mayisText() {
    setState(() {
      blogText = 'mayıs';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(blogText),
            RaisedButton(
              onPressed: martText,
              child: Text('mart'),
            ),
            RaisedButton(
              onPressed: nisanText,
              child: Text('nisan'),
            ),
            RaisedButton(
              onPressed: mayisText,
              child: Text('mayıs'),
            ),
          ],
        ),
      ),
    );
  }
}
