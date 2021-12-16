import 'package:flutter/material.dart';
import 'package:flutter_calendar/rec.dart';
import 'launcher.dart';

var value;

class Record1 extends StatefulWidget {
  const Record1({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Record1State();
  }
}

class _Record1State extends State<Record1> {
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
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.grey),
                        underline: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['เลือก', 'ATK', 'Rapid test', 'RT-PCR']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20),
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
                          decoration: InputDecoration(
                            hintText: 'วัน/เดือน/ปี',
                            suffixIcon: Icon(Icons.calendar_today_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'ผลตรวจ',
                        style: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 50),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Positive'),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(width: 50),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Negative'),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.blueAccent),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'รูปภาพผลตรวจ',
                        style: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: ElevatedButton.icon(
                              icon: Icon(
                                Icons.save_alt_outlined,
                                size: 24.0,
                              ),
                              onPressed: () {},
                              label: Text('Uplode image'),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Save'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green[300]),
                        ),
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
