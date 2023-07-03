// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:instant_doctor/api/auth.dart';
import 'package:instant_doctor/screen/auth/signup.dart';
import 'package:instant_doctor/screen/home/home.dart';
import 'package:instant_doctor/static/inputfield.dart';
import 'package:instant_doctor/static/inputfieldd.dart';
import 'package:instant_doctor/static/button.dart';
import 'package:instant_doctor/values/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  int index = 0;
  toggleFun(state) {
    setState(() {
      index = state;
    });
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() async {
    if (emailController.text == '' || passwordController.text == '') {
      Fluttertoast.showToast(msg: 'Fill out all the Fields. Invalid!');
    } else {
      if (await AuthApi.login(
        emailController.text.toString(),
        passwordController.text.toString(),
      )) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    }
  }

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
              Container(
                padding: EdgeInsets.only(bottom: 66, top: 8),
                child: Text(
                  'Login now for find doctor',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      color: Color.fromARGB(255, 29, 132, 33)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 21),
                child: InputField(
                  hint: 'Enter Your Email:',
                  controller: emailController,
                  type: TextInputType.emailAddress,
                ),
              ),
              InputField2(
                hint: 'Enter Your Password:',
                toggle: _toggle,
                obscure: _obscureText,
                controller: passwordController,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 28),
                child: LargeButtons(
                  title: 'Login',
                  color: mainColor,
                  screenRatio: 0.7,
                  onPressed: () {
                    login();
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 19),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: Text(
                    'For Register Click here',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
