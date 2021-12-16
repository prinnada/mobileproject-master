import 'package:flutter/material.dart';
import 'package:flutter_calendar/howareyou.dart';
import 'package:flutter_calendar/instructive.dart';
import 'package:flutter_calendar/rec.dart';
import 'dart:convert';
import 'package:flutter_calendar/welcome.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'contact.dart';
import 'record.dart';

class Launcher extends StatefulWidget {
  const Launcher({Key key}) : super(key: key);

  @override
  _LauncherState createState() => _LauncherState();
}

class _LauncherState extends State<Launcher>
    with SingleTickerProviderStateMixin {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  SharedPreferences prefs;
  TabController controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
    controller = TabController(length: 5, vsync: this);
    controller.addListener(() {});
    initPrefs();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.getString("events") ?? "{}")));
    });
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leading: (IconButton(
              onPressed: () {
                MaterialPageRoute materialPageRoute = MaterialPageRoute(
                    builder: (BuildContext context) => Welcome());
                Navigator.of(context).push(materialPageRoute);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ))),
          title: Text(
            //'${controller.index + 1}',
            '',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(30.0),
              topRight: const Radius.circular(30.0),
            ),
          ),
          width: MediaQuery.of(context).size.height * 0.15,
          height: MediaQuery.of(context).size.height * 0.08,
          child: TabBar(controller: controller, tabs: [
            Tab(
              icon: Icon(Icons.home, size: 50.0),
            ),
            Tab(
              icon: Icon(
                Icons.calendar_today,
                size: 45.0,
              ),
            ),
            Tab(
              icon: Icon(Icons.add_box_outlined, size: 50.0),
            ),
            Tab(
              icon: Icon(Icons.circle_notifications_outlined, size: 50.0),
            ),
            Tab(
              icon: Icon(Icons.person, size: 50.0),
            ),
          ]),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            //Home
            Container(
              child: SingleChildScrollView(
                child: Container(
                  child: Container(
                    child: Column(children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blueAccent[400],
                            borderRadius: BorderRadius.only(
                              bottomLeft: const Radius.circular(40.0),
                              bottomRight: const Radius.circular(40.0),
                            )),
                        height: MediaQuery.of(context).size.height * 0.32,
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 500.0,
                              height: 250.0,
                              child: Card(
                                child: Image.asset(
                                  'assets/images/banner.png',
                                  fit: BoxFit.fill,
                                ),
                                
                              ),
                            ),
                            RaisedButton(
                              color: Colors.blueAccent[400],
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Instructive()),
                                );
                              },
                              child: Text(
                                '',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(05.0),
                        height: MediaQuery.of(context).size.height * 0.16,
                        child: Card(
                          color: Colors.blueAccent,
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
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 20),
                                          Text(
                                            'วันนี้คุณรู้สึกอย่างไร',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: 20),
                                          Text(
                                            'บอกเราเพิ่มเกี่ยวกับตัวคุณ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: 20),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HowAreYou()),
                                              );
                                            },
                                            child: Text('เพิ่มอาการ'),
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.green[300]),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        padding: const EdgeInsets.all(05.0),
                        height: MediaQuery.of(context).size.height * 0.16,
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
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 20),
                                          Text(
                                            'พูดคุยกับคุณหมอ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: 20),
                                          Text(
                                            'ช่องทางการติดต่อกับคุณหมอ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: 20),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Contact()),
                                              );
                                            },
                                            child: Text('    คลิก     '),
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.green[300]),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        padding: const EdgeInsets.all(05.0),
                        height: MediaQuery.of(context).size.height * 0.16,
                        child: Card(
                          color: Colors.blueAccent,
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
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 20),
                                          Text(
                                            'บันทึกผลตรวจ Covid-19',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: 20),
                                          Text(
                                            'บันทึกผลการตรวจได้ทุกรูปแบบ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: 20),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Rec()),
                                              );
                                            },
                                            child: Text('    คลิก     '),
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.green[300]),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),

            //Calendar
            Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TableCalendar(
                      events: _events,
                      initialCalendarFormat: CalendarFormat.week,
                      calendarStyle: CalendarStyle(
                          canEventMarkersOverflow: true,
                          todayColor: Colors.orange,
                          selectedColor: Theme.of(context).primaryColor,
                          todayStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.white)),
                      headerStyle: HeaderStyle(
                        centerHeaderTitle: true,
                        formatButtonDecoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        formatButtonTextStyle: TextStyle(color: Colors.white),
                        formatButtonShowsNext: false,
                      ),
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      onDaySelected: (date, events) {
                        setState(() {
                          _selectedEvents = events;
                        });
                      },
                      builders: CalendarBuilders(
                        selectedDayBuilder: (context, date, events) =>
                            Container(
                                margin: const EdgeInsets.all(4.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Text(
                                  date.day.toString(),
                                  style: TextStyle(color: Colors.white),
                                )),
                        todayDayBuilder: (context, date, events) => Container(
                            margin: const EdgeInsets.all(4.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                              date.day.toString(),
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      calendarController: _controller,
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          _showAddDialog();
                          print('You click ');
                        },
                        child: Text('Add note'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.redAccent),
                        ),
                      ),
                    ),
                    ..._selectedEvents.map((event) => ListTile(
                          title: Text(event),
                          tileColor: Colors.blue[50],
                        )),
                  ],
                ),
              ),
            ),

            //Contact
            Container(
              child: Text('How are you'),
            ),

            //Noti

            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      alignment: Alignment(-0.5, -0.5),
                      child: Column(children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Notification Center',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: 2,
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      height: MediaQuery.of(context).size.height * 0.18,
                      child: Card(
                        color: Colors.green[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 8,
                        child: Container(
                            child: Center(
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.add_alert,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                          'Fever Alert',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'How are you today? Have you take a fever yet?',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      height: MediaQuery.of(context).size.height * 0.18,
                      child: Card(
                        color: Colors.green[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 8,
                        child: Container(
                            child: Center(
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.add_alert,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                          'Symptom Alert',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'How are you feeling today? Please tell me.',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),

            //Profile
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://i.mydramalist.com/ZrLd8c.jpg'),
                          radius: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Jennie Kim',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('jenkim@gmail.com',
                                  style: Theme.of(context).textTheme.subtitle2),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: (Container(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Personal Information',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('First Name: Jennie',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2),
                                      Spacer(
                                        flex: 1,
                                      ),
                                      Text('Gender: Female',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2),
                                      Spacer(
                                        flex: 1,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Last Name: Kim',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2),
                                      Spacer(
                                        flex: 1,
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Text('Age: 25',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2),
                                      Spacer(
                                        flex: 2,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            height: 150.0,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.all(
                                Radius.circular(22.0), // radius
                              ),
                            ),
                          )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Report',
                        style: Theme.of(context).textTheme.headline5),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: (Container(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.account_tree_rounded,
                                        color: Colors.white,
                                        size: 115,
                                      ),
                                      Spacer(
                                        flex: 1,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'My Timelines',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Apply your timeline to',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          ),
                                          Text(
                                            'track your symptoms!',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          ),
                                        ],
                                      ),
                                      Spacer(
                                        flex: 1,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            height: 150.0,
                            decoration: BoxDecoration(
                              color:Colors.green[300],
                              borderRadius: BorderRadius.all(
                                Radius.circular(22.0), // radius
                              ),
                            ),
                          )),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 350,
                          height: 100,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            MaterialPageRoute materialPageRoute =
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Welcome());
                            Navigator.of(context).push(materialPageRoute);
                          },
                          child: Text('Log out'),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.redAccent),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showAddDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              title: Text("Note"),
              backgroundColor: Colors.grey[100],
              content: Container(
                child: TextField(
                  controller: _eventController,
                  decoration: const InputDecoration(hintText: 'Add a note'),
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Save"),
                  onPressed: () {
                    if (_eventController.text.isEmpty) return;
                    if (_events[_controller.selectedDay] != null) {
                      _events[_controller.selectedDay]
                          .add(_eventController.text);
                    } else {
                      _events[_controller.selectedDay] = [
                        _eventController.text
                      ];
                    }
                    prefs.setString("events", json.encode(encodeMap(_events)));
                    _eventController.clear();

                    Navigator.pop(context);
                  },
                )
              ],
            ));
    setState(() {
      _selectedEvents = _events[_controller.selectedDay];
    });
  }
}
