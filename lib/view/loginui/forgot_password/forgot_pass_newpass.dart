import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapshot/view/dashboard.dart';
import 'package:snapshot/view/loginui/loginview.dart';

class Newpassword extends StatefulWidget {
  const Newpassword({super.key});

  @override
  State<Newpassword> createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {
  TextEditingController passclr = TextEditingController();
  TextEditingController repass = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Verify your Email",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF431F82))),
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                "Get Your Code",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF431F82))),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Please enter the 4 digit code that',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400, fontSize: 14),
              ),
              Text(
                'send to your email address',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400, fontSize: 14),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: passclr,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF431F82))),
                          prefixIcon: Icon(Icons.lock_outline_rounded),
                          suffixIcon: Icon(Icons.remove_red_eye_outlined),
                          labelText: "Password"),
                      validator: (value) {
                        if (value == null) {
                          return "Please enter your password";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: repass,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF431F82))),
                          prefixIcon: Icon(Icons.lock_outline_rounded),
                          suffixIcon: Icon(Icons.remove_red_eye_outlined),
                          labelText: "Confirm Password"),
                      validator: (value) {
                        if (value == null) {
                          return "Please Re-enter your password";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 50,),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          color: Color(0xFF431F82),
                        ),
                        height: 60,
                        width: 400,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF431F82),
                            ),
                            onPressed: () {
                              if (_formkey.currentState!.validate()){
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
                                  return Loginview();
                                }));
                              }
                            },
                            child: const Text(
                              " Recover Password",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ))),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
