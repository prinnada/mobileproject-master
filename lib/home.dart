import 'package:flutter/material.dart';
import 'contact.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: (IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ))),
        title: Text(
          'Homepage',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Container(
            child: Column(children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  width: 460.0,
                  height: 230.0,
                  child: Card(
                    child: Image.asset(
                      'assets/images/banner.png',
                      fit: BoxFit.fill,
                    ),
                    elevation: 30.0,
                  ),
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
                                      //go to how are you page
                                    },
                                    child: Text('เพิ่มอาการ'),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.greenAccent),
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
              SizedBox(height: 20.0),
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
                                      // print('You click ');
                                      // MaterialPageRoute materialPageRoute =
                                      //     MaterialPageRoute(
                                      //         builder: (BuildContext context) =>
                                      //             Contact());
                                      // Navigator.of(context)
                                      //     .push(materialPageRoute);
                                    },
                                    child: Text('คลิก'),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.greenAccent),
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
    );
  }
}
