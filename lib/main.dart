import 'package:flutter/material.dart';
import 'package:snapshot/view/Homeui/homeview.dart';
import 'package:snapshot/view/Homeui/homeviewmodel.dart';
import 'package:snapshot/view/dashboard.dart';
import 'package:snapshot/view/loginui/loginview.dart';
import 'package:snapshot/view/signupui/pageview/profile_photo.dart';
import 'package:snapshot/view/splashui/splashview.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Splashview());
  }
}
