import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snapshot/view/loginui/loginview.dart';
import 'package:snapshot/view/splashui/splashviewmodel.dart';
import 'package:stacked/stacked.dart';

class Splashview extends StatefulWidget {
  const Splashview({super.key});

  @override
  State<Splashview> createState() => _SplashviewState();
}

class _SplashviewState extends State<Splashview> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
        return Loginview();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF431F82),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bgsplashsnapshot.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Image.asset(
                "assets/images/splashlogosnapshot.png",
                scale: 1.3,
              ),
            ),
          ),
        ));
  }
}
