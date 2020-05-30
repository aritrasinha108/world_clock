

import 'package:flutter/material.dart';
import 'package:worldclock/screens/home.dart';
import 'package:worldclock/screens/loading.dart';
import 'package:worldclock/screens/choose_location.dart';

void main() => runApp(MaterialApp(
  initialRoute:'/',
      routes: {
    '/':(context) => Loading(),
    '/home':(context) => Home(),
    '/location':(context) => Location(),
},
));

