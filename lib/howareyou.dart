import 'package:flutter/material.dart';
import 'launcher.dart';
class HowAreYou extends StatefulWidget {
  const HowAreYou({ Key key }) : super(key: key);

  @override
  _HowAreYouState createState() => _HowAreYouState();
}

class _HowAreYouState extends State<HowAreYou> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: (IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Launcher()),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ))),
        title: Text(
          'How Are You',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        child: Text('How are you'),
      ),
    );
  }
}