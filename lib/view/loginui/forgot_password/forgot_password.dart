import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'forgot_pass_otppage.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailclr = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Forgot Password ?",
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
              "Mail Address Here",
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
              'Enter the email address associated ',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400, fontSize: 14),
            ),
            Text(
              'with your account',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400, fontSize: 14),
            ),
            SizedBox(
              height: 50,
            ),
            Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: TextFormField(
                  controller: emailclr,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF431F82))),
                      prefixIcon: Icon(Icons.email_outlined),
                      labelText: "Enter your Email"),
                  validator: (value) {
                    if (value == null) {
                      return "Please enter your Email";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
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
                      if (formkey.currentState!.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext) {
                          return Otp_page();
                        }));
                      }
                    },
                    child: const Text(
                      " Recover Password",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))),
          ],
        ),
      ),
    );
  }
}
