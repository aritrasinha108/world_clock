import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:worldclock/services/world_time.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
  ];
  @override
  void updateTime(index) async
  { WorldTime instance=locations[index];
     await instance.getTime();
     Navigator.pop(context,{
       'location':instance.location,
       'flag':instance.flag,
       'time':instance.time,
       'isdaytime':instance.isdaytime,
     });

  }
  void initState()
  {
    super.initState();

  }
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Choose Location"),
        centerTitle: true,
        elevation: 0,
      ),
 body: ListView.builder(
 itemCount: locations.length,
   itemBuilder: (context, index)
   { return Card(
     child: Padding(
       padding: EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
       child: ListTile(
         onTap: (){
          updateTime(index);
         },
         leading: CircleAvatar(
           backgroundImage: AssetImage('assets/${locations[index].flag}'),
         ),
        title: Text(locations[index].location,
        ),
       ),
     ),
   );

   }
   ),
    );
  }

}
