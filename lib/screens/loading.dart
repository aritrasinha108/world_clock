import 'package:flutter/material.dart';
import 'package:worldclock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String data='Loading';
  void setupWorldTime() async
  {
    WorldTime instance=WorldTime(flag: 'India.png',location: 'Kolkata',url: 'Asia/Kolkata');
    await instance.getTime();
     print(instance.time);
   Navigator.pushReplacementNamed(context, '/home',arguments: {
     'location':instance.location,
     'flag':instance.flag,
     'time':instance.time,
     'isdaytime':instance.isdaytime,
   });
  }

  @override
  void initState ()
  {
    super.initState();
    setupWorldTime();

  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Loading....",
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
            ),),
             SizedBox(height: 10.0),
             SpinKitPulse(
          color: Colors.white,
          size: 50.0,
        ),
          ],
        ),
      )
    );
  }
}
