import 'dart:html';

import 'package:flutter/material.dart';

import 'model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/profile': (context) => Profile(),
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var t1 = TextEditingController();
  var t2 = TextEditingController();

  profile() {
    if (t1.text == 'admin' && t2.text == '1234')
      Navigator.pushNamed(context, '/profile',
          arguments: DataModel(t1.text, t2.text));
    else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('kullanıcı adı veya şifre yanlış'),
              content: Text('lütfen giriş bilgilerininiz tekrar giriniz'),
              actions: [
                new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('kapat'),
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('giriş ekranı'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(80),
          child: Column(
            children: [
              TextFormField(
                decoration:
                    InputDecoration(hintText: 'Kullanıcı adınızı giriniz'),
                controller: t1,
              ),
              TextFormField(
                decoration:
                    InputDecoration(hintText: 'Şifrenizi adınızı giriniz'),
                controller: t2,
              ),
              RaisedButton(
                onPressed: profile,
                child: Text('profil sayfasına git'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  home() {
    Navigator.pop(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    DataModel? model = ModalRoute.of(context)?.settings.arguments as DataModel?;

    return Scaffold(
      appBar: AppBar(
        title: Text('profil ekranı'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(model!.username),
            Text(model.password),
            Center(
              child: RaisedButton(
                onPressed: home,
                child: Text('home sayfasına git'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
