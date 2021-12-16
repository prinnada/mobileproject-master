import 'package:flutter/material.dart';
import 'package:flutter_calendar/record.dart';
import 'package:flutter_calendar/seemore.dart';
import 'launcher.dart';

var value;

class Rec extends StatefulWidget {
  const Rec({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RecState();
  }
}

class _RecState extends State<Rec> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
          'Record ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(05.0),
        height: MediaQuery.of(context).size.height * 0.70,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 8,
          child: Container(
            child: Center(
                child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(height: 30),
                            Text(
                              'TYPE: ATK',
                              style: TextStyle(
                                  color: Colors.indigo[900],
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Text(
                              'DATE: 22/11/21',
                              style: TextStyle(
                                  color: Colors.indigo[900],
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                'RESULTS: Negative',
                                style: TextStyle(
                                    color: Colors.indigo[900],
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Record2()),
                          );
                        },
                        child: Text('See more'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey),
                        ),
                      ),
                      Divider(
                        height: 20,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.black,
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_box_outlined, size: 40.0,),
                        
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Record1()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
        ),
      )),
    );
  }
}
