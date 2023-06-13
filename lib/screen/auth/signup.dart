import 'package:flutter/material.dart';
import 'package:instant_doctor/static/inputfield.dart';
import 'package:instant_doctor/static/button.dart';
import 'package:instant_doctor/values/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Welcome, on Instant Dr.',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23),
                  ),
                ),
                 Container(padding: EdgeInsets.only(bottom: 46,top: 8),
                  child: Text(
                    'Register now for find doctor',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17,color: Color.fromARGB(255, 29, 132, 33)),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(bottom: 11),
                  child: InputField(
                    hint: 'Enter Your Full Name:',
                  ),
                ),
               Padding(
                  padding: const EdgeInsets.only(bottom: 11),
                  child: InputField(
                    hint: 'Enter Your E-Mail',
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(bottom: 11),
                  child: InputField(
                    hint: 'Enter Your Phone #',
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(bottom: 11),
                  child: InputField(
                    hint: 'Enter Your Password:',
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(bottom: 11),
                  child: InputField(
                    hint: 'Conform Password',
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(bottom: 7,top: 14),
                  child: LargeButtons(
                    title: 'Register',
                    color: mainColor,
                    screenRatio: 0.7,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    'For Register Click here',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
                  ),
                ),
            ],
          ),
        ),
      )),
    );
  }
}
