import 'package:flutter/material.dart';
import 'package:flutter_calendar/seemore.dart';
import 'welcome.dart';
import 'package:flutter_calendar/welcome.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Welcome(),
    );
  }
}
