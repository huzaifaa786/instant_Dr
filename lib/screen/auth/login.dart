import 'package:flutter/material.dart';
import 'package:instant_doctor/static/inputfield.dart';
import 'package:instant_doctor/static/button.dart';
import 'package:instant_doctor/values/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'Welcome, on Instant Dr.',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23),
                ),
              ),
              Container(
                child: Text(
                  'Login now for find doctor',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
                ),
              ),
              InputField(
                hint: 'Enter Your Phone #',
              ),
               InputField(
                hint: 'Enter Your Password:',
              ),
               LargeButtons(title: 'Login', color: mainColor,),
 Container(padding: EdgeInsets.only(),
                child: Text(
                  'For Register Click here',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
