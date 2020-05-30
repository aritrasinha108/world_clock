import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime
{
  String location;
  String url;
  String time;
  String flag;
  bool isdaytime;
  WorldTime({this.location,this.url,this.flag});


  Future<void> getTime() async
  {
    try
    {
      Response response= await get('http://worldtimeapi.org/api/timezone/$url');
      Map data =jsonDecode(response.body);
    print(data);
      String datetime=data['datetime'];
      String offset=data['utc_offset'].substring(1,3);
    print(datetime);
    print(offset);
      DateTime now =DateTime.parse(datetime);
print(now);
      now=now.add(Duration(hours: int.parse(offset)));
print(now);
      isdaytime=((now.hour>6) && (now.hour<19))==true?true:false;
      print(now.hour);
    time=DateFormat.jm().format(now);

  print(time);

    }
    catch(e)
    {
      print("Error:$e");
      time="Could not get data";
    }
  }
}