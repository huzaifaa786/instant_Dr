// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:instant_doctor/api/auth.dart';
import 'package:instant_doctor/screen/auth/login.dart';
import 'package:instant_doctor/screen/home/home.dart';
import 'package:instant_doctor/static/inputfield.dart';
import 'package:instant_doctor/static/button.dart';
import 'package:instant_doctor/values/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  bool emailValid = false;

  onEmailChanged(value) {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      setState(() {
        emailValid = true;
      });
    } else {
      setState(() {
        emailValid = false;
      });
    }
  }

  register() async {
    if (emailValid) {
      if (phone.text.length == 11) {
        if (name.text == '' ||
            email.text == '' ||
            password.text == '' ||
            cpassword.text == '') {
          Fluttertoast.showToast(msg: 'Fill out all the Fields. Invalid!');
        } else {
          if (password.text != cpassword.text) {
            Fluttertoast.showToast(
                msg: 'Password and Confirm Password field are not same');
          } else {
            if (await AuthApi.register(
                name.text.toString(),
                email.text.toString(),
                phone.text.toString(),
                password.text.toString())) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            } else {
              Fluttertoast.showToast(msg: 'Error!');
            }
          }
        }
      } else {
        Fluttertoast.showToast(
            msg:
                'Invalid Phone Number! Phone Number contain atleast 11 digit.');
      }
    } else {
      Fluttertoast.showToast(msg: 'Invalid! Email Format.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                margin: EdgeInsets.only(top: 40),
                child: Text(
                  'Welcome, on Instant Dr.',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 46, top: 8),
                child: Text(
                  'Register now for find doctor',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      color: Color.fromARGB(255, 29, 132, 33)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 11),
                child: InputField(
                  hint: 'Enter Your Full Name:',
                  controller: name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 11),
                child: InputField(
                    hint: 'Enter Your E-Mail',
                    controller: email,
                    type: TextInputType.emailAddress,
                    onchange: onEmailChanged),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 11),
                child: InputField(
                  hint: 'Enter Your Phone #',
                  controller: phone,
                  type: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 11),
                child: InputField(
                  hint: 'Enter Your Password:',
                  controller: password,
                  obscure: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 11),
                child: InputField(
                  hint: 'Conform Password',
                  controller: cpassword,
                  obscure: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 7, top: 14),
                child: LargeButtons(
                  title: 'Register',
                  color: mainColor,
                  screenRatio: 0.7,
                  onPressed: () {
                    register();
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    'For login Click here',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
