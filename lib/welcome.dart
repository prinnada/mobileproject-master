import 'package:flutter/material.dart';
import 'package:flutter_calendar/calendar.dart';
import 'package:flutter_calendar/contact.dart';
import 'package:flutter_calendar/launcher.dart';
import 'package:flutter_calendar/Login.dart';

class Welcome extends StatefulWidget {
  const Welcome({key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final ImageList = [
    "assets/images/covid.png",
    "assets/images/s1.jpg",
    "assets/images/s2.jpg",
    "assets/images/s3.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/covid.png',
                  width: 450.0,
                  height: 450.0,
                  fit: BoxFit.cover,
                ),
                Text(
                  'Welcome to Track Your Covid',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      color: Colors.green[300],
                      onPressed: () {
                        print('You click ');
                        MaterialPageRoute materialPageRoute = MaterialPageRoute(
                            builder: (BuildContext context) => Login());
                        Navigator.of(context).push(materialPageRoute);
                      },
                      child: Text(
                        'START',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
