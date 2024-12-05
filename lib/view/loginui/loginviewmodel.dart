import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

class Loginviewmodel extends BaseViewModel {
  TextEditingController emailclr = TextEditingController();
  TextEditingController passclr = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailclr.dispose();
    passclr.dispose();
  }

  // void login() {
  //   if (formkey.currentState!.validate()) {
  //     // Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
  //     //   return Home();
  //     // }));
  //   }
  }

