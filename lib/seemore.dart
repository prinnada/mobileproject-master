import 'package:flutter/material.dart';
import 'package:flutter_calendar/rec.dart';
import 'launcher.dart';

var value;

class Record2 extends StatefulWidget {
  const Record2({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Record2State();
  }
}

class _Record2State extends State<Record2> {
  String dropdownValue = 'เลือก';

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
                MaterialPageRoute(builder: (context) => Rec()),
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
        height: MediaQuery.of(context).size.height * 0.80,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 30),
                          Text(
                            'ประเภทชุดตรวจของคุณ',
                            style: TextStyle(
                                color: Colors.indigo[900],
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'ATK',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'วันที่ตรวจ',
                        style: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: '22/11/21',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'ผลการตรวจ',
                        style: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'Negative',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'ผลตรวจ',
                        style: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/test.jpg',
                            width: 370.0,
                            height: 175.0,
                            fit: BoxFit.cover,
                          ),
                        ],
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
