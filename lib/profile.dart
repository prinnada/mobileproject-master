import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
   
  const MyProfile({Key key}) : super(key: key);

  @override
    State<StatefulWidget> createState() {
        return _MyProfileState();
    }
}

class _MyProfileState extends State<MyProfile> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: (IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ))),
        title: Text(
          'My Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://i.mydramalist.com/ZrLd8c.jpg'),
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
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('First Name: Jennie',
                                  style: Theme.of(context).textTheme.bodyText2),
                              Spacer(
                                flex: 1,
                              ),
                              Text('Gender: Female',
                                  style: Theme.of(context).textTheme.bodyText2),
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
                                  style: Theme.of(context).textTheme.bodyText2),
                              Spacer(
                                flex: 1,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text('Age: 25',
                                  style: Theme.of(context).textTheme.bodyText2),
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
            Text('Report', style: Theme.of(context).textTheme.headline5),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'My Timelines',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Apply your timeline to',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                  Text(
                                    'track your symptoms!',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
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
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(22.0), // radius
                      ),
                    ),
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
      
    );
  }
}
