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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'Welcome, on Instant Dr.',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23),
                ),
              ),
              Container(padding: EdgeInsets.only(bottom: 66,top: 8),
                child: Text(
                  'Login now for find doctor',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17,color: Color.fromARGB(255, 29, 132, 33)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 21),
                child: InputField(
                  hint: 'Enter Your Phone #',
                ),
              ),
              InputField(
                hint: 'Enter Your Password:',
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10,top: 28),
                child: LargeButtons(
                  title: 'Login',
                  color: mainColor,
                  screenRatio: 0.7,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 19),
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
