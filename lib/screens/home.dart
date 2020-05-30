import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = (data.isNotEmpty) ? data : ModalRoute.of(context).settings.arguments;
    String bgimg = (data['isdaytime'] == true) ? 'day.jpg' : 'night.jpg';

    return Scaffold(
        backgroundColor: Colors.white70,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgimg'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 40.0),
                        child: FlatButton.icon(
                          onPressed: () async {
                            dynamic result = await Navigator.pushNamed(context, '/location');
                            if (result != null)
                              {setState(() {
                                data = {
                                  'location': result['location'],
                                  'flag': result['flag'],
                                  'isdaytime': result['isdaytime'],
                                  'time': result['time']
                                };
                                print("Data assigned");
                              });
                          }
                            },
                          icon: Icon(
                            Icons.add_location,
                            color: Colors.red,
                          ),
                          color: Colors.white70,
                          label: Text("Edit Location"),
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 250.0,
                ),
                Text(
                  data['location'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45.0,
                    letterSpacing: 1.0,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 62.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
