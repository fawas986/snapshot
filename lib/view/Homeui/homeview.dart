import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:snapshot/service/apiservice.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  bool isliked=false;
  Apiservice apiservice = Apiservice();
  List plist = [
    "assets/images/place1.png",
    "assets/images/place3.png",
    "assets/images/mountain.png",
    "assets/images/place4.png",
    "assets/images/place2.png"

  ];
  List ulist = [
    "assets/images/men1.png",
    "assets/images/cat1.png",
    "assets/images/men2.png",
    "assets/images/dog1.png",
    "assets/images/dog2.png",
  ];
  List nlist = ["Danial Mike", "Lily", "Diana", "Susan", "John Wick"];
  List dlist = [
    "12-09-2024",
    "08-12-2024",
    "12-09-2024",
    "08-12-2024",
    "12-09-2024",
  ];
  List polist = [
    "assets/images/post2.png",
    "assets/images/post5.png",
    "assets/images/post3.png",
    "assets/images/post1.png",
    "assets/images/post2.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 210, 206, 206),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.teal,
          ),
        ),
        title: Column(
          children: [
            Text(
              "Welcome",
              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14)),
            ),
            Text("Diana Susan"),
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment(-0.9, 0),
                child: Text(
                  "Latest Snaps",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF431F82))),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 166,
              width: double.infinity,
              // decoration: BoxDecoration(color: Colors.teal),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  width: 10,
                ),
                itemCount: plist.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      // Navigator.pop(context);
                    },
                    child: Container(
                      width: 115,
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      child: Stack(
                        children: [
                          Image(
                            image: AssetImage(plist[index]),
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                            left: 10,
                            top: 10,
                            child: CircleAvatar(
                              backgroundColor: Color(0xFF431F82),
                              radius: 25,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(ulist[index]),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                      width: 10,
                    ),
                itemCount: nlist.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    height: 360,
                    child: Column(children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(ulist[index]),
                        ),
                        title: Text(nlist[index]),
                        subtitle: Text(dlist[index]),
                        trailing: Icon(Icons.file_download),
                      ),
                      GestureDetector(
                        onDoubleTap: (){
                          setState(() {
                            isliked = !isliked;
                          });
                        },
                        child: Container(
                          height: 213,
                          width: double.infinity,
                          child: Image(
                            image: AssetImage(polist[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap:(){
                               setState(() {
                                 isliked = !isliked;
                               });
                              },
                              child: Icon(
                                Icons.favorite,
                                size: 30,
                                color: isliked ? Colors.red : Colors.white
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              EvaIcons.message_circle_outline,
                              size: 25,
                              color: Color(0xFF431F82),
                            )
                          ],
                        ),

                      ),

                      Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              SizedBox(height: 0,width: 5,),
                              Text(nlist[index]),
                              SizedBox(width: 5,),
                              Text("#photo #photography #picoftheday",style: TextStyle(color: Color(0xFF431F82)),)
                            ],
                          ))
                    ]),
                  );
                }),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}

// FutureBuilder(
//   future: null,
//   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//     if(snapshot.hasData){
//       Container(
//         height: 640,
//         width: double.infinity,
//         decoration: BoxDecoration(color: Colors.teal),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 10,
//             ),
//             ListView.separated(
//               separatorBuilder: (BuildContext context, int index) =>
//               const SizedBox(
//                 width: 10,
//               ),
//               itemCount: 10,
//               itemBuilder: (BuildContext context, int index) {
//                 return Container(
//                   child: Stack(
//                     children: [
//                       ListTile(
//                         leading: CircleAvatar(backgroundImage:NetworkImage("${snapshot.data![index].id}")),),
//
//                     ],
//                   ),
//                 );
//               },
//             )
//           ],
//         ),
//       );
//     } else if (snapshot.hasError){
//       return Center(child: Text("${snapshot.error}"),);
//     }else {return Container();}
//   },
// )

// class StoryViewPage extends StatefulWidget {
//   final List<String> plist;
//
//   const StoryViewPage({Key? key, required this.plist}) : super(key: key);
//
//   @override
//   _StoryViewPageState createState() => _StoryViewPageState();
// }
//
// class _StoryViewPageState extends State<StoryViewPage> {
//   int _currentIndex = 0;
//   late Timer _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     _startTimer();
//   }
//
//   void _startTimer() {
//     _timer = Timer(const Duration(seconds: 5), () {
//       if (_currentIndex < widget.plist.length - 1) {
//         setState(() {
//           _currentIndex++;
//         });
//       } else {
//         Navigator.pop(context);
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           Center(
//             child: Image.asset(
//               widget.plist[_currentIndex],
//               fit: BoxFit.contain,
//             ),
//           ),
//           Positioned(
//             top: 40,
//             right: 20,
//             child: IconButton(
//               icon: const Icon(
//                 Icons.close,
//                 color: Colors.white,
//                 size: 30,
//               ),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
