import 'package:animated_botton_navigation/animated_botton_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snapshot/view/Homeui/homeview.dart';
import 'package:snapshot/view/downloadpage/downloadview.dart';
import 'package:snapshot/view/loginui/loginview.dart';
import 'package:snapshot/view/profileui/profileview.dart';
import 'package:snapshot/view/searchui/searchview.dart';
import 'package:snapshot/view/signupui/signupview.dart';
import 'package:snapshot/view/uploadpage/uploadview.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex=0;
  final List _pages=[
    Homeview(),
    Downloadview(),
    Uploadview(),
    Searchview(),
    Profileview()


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: AnimatedBottomNavigation(
        icons: const [
          Icons.home,
          Icons.file_download,
          Icons.upload_rounded,
          Icons.people_alt_rounded,
          Icons.person
        ],
        currentIndex: _currentIndex,
        onTapChange: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor:Color.fromRGBO(236, 233, 242, 1.0),
        selectedColor: Color(0xFF431F82),
        unselectedColor: Colors.grey,
      ),
    );
  }
}
