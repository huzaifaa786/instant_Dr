// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instant_doctor/screen/auth/login.dart';
import 'package:instant_doctor/static/button.dart';
import 'package:instant_doctor/values/colors.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 15),
            child: SvgPicture.asset('assets/images/intro.svg'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Text(
              'Find the Best Doctor near you',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
            child: Text(
              'Instant Dr. - Find A Doctor, a\n platform for any person looking\n for a healthcare facility.',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: LargeButtons(
              title: 'Get Started',
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              color: mainColor,
              screenRatio: 0.5,
              textcolor: Colors.white,
            ),
          )
        ],
      )),
    );
  }
}
