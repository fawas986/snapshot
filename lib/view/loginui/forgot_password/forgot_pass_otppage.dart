import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapshot/view/loginui/forgot_password/forgot_pass_newpass.dart';

class Otp_page extends StatefulWidget {
  const Otp_page({super.key});

  @override
  State<Otp_page> createState() => _Otp_pageState();
}

class _Otp_pageState extends State<Otp_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
            OtpTextField(
              keyboardType: TextInputType.number,
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext) {
                  return Newpassword();
                }));
              }, // end onSubmit
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
