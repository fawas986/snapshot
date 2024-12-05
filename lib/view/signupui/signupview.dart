import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapshot/view/loginui/loginview.dart';
import 'package:snapshot/view/signupui/pageview/profile_photo.dart';
import 'package:snapshot/view/signupui/signupviewmodel.dart';
import 'package:stacked/stacked.dart';

class Signupview extends StatelessWidget {
  const Signupview({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupviewModel>.reactive(
      viewModelBuilder: () {
        return SignupviewModel();
      },
      builder:
          (BuildContext context, SignupviewModel viewModel, Widget? child) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 210, 206, 206),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/bgsplashsnapshot.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 250,
                    width: 400,
                    child: const Image(
                        image: AssetImage("assets/images/logosnapshot.png")),
                  ),
                  Form(
                    key: viewModel.formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign in to your account",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color(0xFF431F82), fontSize: 30),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: viewModel.nameclr,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF431F82))),
                              prefixIcon: Icon(Icons.person_outline_sharp),
                              labelText: "Enter your Name"),
                          validator: (value) {
                            if (value == null) {
                              return "Please enter your Name";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: viewModel.emailclr,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF431F82))),
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
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: viewModel.passclr,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF431F82))),
                              prefixIcon: Icon(Icons.lock_outline_sharp),
                              suffixIcon: Icon(Icons.remove_red_eye_outlined),
                              labelText: "Create a Password"),
                          validator: (value) {
                            if (value == null) {
                              return "Please enter a Password";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: viewModel.repassclr,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF431F82))),
                              prefixIcon: Icon(Icons.lock_outline_sharp),
                              suffixIcon: Icon(Icons.remove_red_eye_outlined),
                              labelText: "Re-Enter the Password"),
                          validator: (value) {
                            if (value == viewModel.passclr) {
                              return "Password don't Match ";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 30,
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
                                  if (viewModel.formkey.currentState!.validate()){
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) => OnboardingPages(),
                                      ),
                                          (Route<dynamic> route) => false,
                                    );

                                  }
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ))),
                        SizedBox(
                          height: 15,
                        ),
                        Text("- Or Sign up with -"),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xFF431F82),
                                      ),
                                      color:
                                          Color.fromARGB(255, 210, 206, 206)),
                                  height: 55,
                                  width: 82,
                                  child: Image(
                                      image: AssetImage(
                                          "assets/images/facebook_logo_nobg.png"))),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xFF431F82),
                                      ),
                                      color:
                                          Color.fromARGB(255, 210, 206, 206)),
                                  height: 55,
                                  width: 82,
                                  child: Image(
                                      image: AssetImage(
                                          "assets/images/google_logo.png"))),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an Account ? "),
                            SizedBox(
                              width: 5,
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => Loginview(),
                                    ),
                                        (Route<dynamic> route) => false,
                                  );
                                },
                                child: Text(
                                  "Sign In now",
                                  style: TextStyle(color: Color(0xFF431F82)),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
