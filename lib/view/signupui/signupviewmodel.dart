import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class SignupviewModel extends BaseViewModel{
  final formkey=GlobalKey<FormState>();
  TextEditingController nameclr=TextEditingController();
  TextEditingController emailclr=TextEditingController();
  TextEditingController passclr=TextEditingController();
  TextEditingController repassclr=TextEditingController();


  // void signup() {
  //   if (formkey.currentState!.validate()) {
  //     // Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
  //     //   return Home();
  //     // }));
  //   }
  // }
}