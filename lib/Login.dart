import 'package:flutter/material.dart';
import 'package:flutter_calendar/calendar.dart';
import 'package:flutter_calendar/contact.dart';
import 'package:flutter_calendar/launcher.dart';

class Login extends StatefulWidget {
  const Login({key}) : super(key: key);

  @override
  _LogineState createState() => _LogineState();
}

class _LogineState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.blue[200],
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.height * 1,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFF90CAF9),
                  radius: 100,
                  backgroundImage: AssetImage('assets/images/5555.png'),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.blue[200],
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.height * 1,
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.height * 0.4,
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'E-mail address '),
                  ),
                ),
                Container(
                  color: Colors.blue[200],
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.height * 1,
                ),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.height * 0.4,
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Password'),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                  ),
                ),
                Container(
                  color: Colors.blue[200],
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.height * 1,
                ),
                Container(
                  alignment: Alignment(-0.65, 0.0),
                  width: MediaQuery.of(context).size.height * 1,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Colors.blue,
                    onPressed: () {
                      print('You click ');
                      MaterialPageRoute materialPageRoute = MaterialPageRoute(
                          builder: (BuildContext context) => Launcher());
                      Navigator.of(context).push(materialPageRoute);
                    },
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                          color: Colors.green[100],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                  width: MediaQuery.of(context).size.height * 1,
                ),
                Container(
                  width: MediaQuery.of(context).size.height * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Text(
                          "Don't have an account? " + "  ",
                          style: TextStyle(fontSize: 16),
                        ),
                        alignment: Alignment.center,
                      ),
                      Container(
                        child: Text(
                          "Sign Up Now ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
