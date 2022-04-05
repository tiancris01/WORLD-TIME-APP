import 'package:flutter/material.dart';
import 'package:world_time/Pages/choose_location.dart';
import 'package:world_time/Pages/loading.dart';
import 'Pages/home.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/Location': (context) => ChooseLocation()
      },
    ));
