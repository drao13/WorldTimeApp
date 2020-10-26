import 'package:com/Pages/Loading.dart';
import 'package:com/Pages/Country.dart';
import 'package:com/Pages/Home.dart';
import 'package:com/Pages/World_Time.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',

  routes: {
    '/': (context) => loading(),
    '/home': (context) => Home(),
    '/location': (context) => country(),
  },
));

