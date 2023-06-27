// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:instant_doctor/helpers/loading.dart';
import 'package:instant_doctor/screen/auth/login.dart';
import 'package:instant_doctor/screen/home/home.dart';
import 'package:instant_doctor/screen/intro/intro.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seen') ?? false);

    if (seen) {
      {
        final String? authCheck = prefs.getString('api_token');
        if (authCheck == null) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginScreen()));
        } else {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      }
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => IntroScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    LoadingHelper.init();
    initscreen();
  }

  void initscreen() async {
    await Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(
                  'assets/images/doctor.png',
                ),
                height: 60,
                width: 60,
              ),
              Text(
                "Find Doctors",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
