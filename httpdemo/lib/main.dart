import 'package:flutter/material.dart';
import 'package:httpdemo/screens/main_screen.dart';

void main() => runApp(HttpApp());

class HttpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}
