// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:instant_doctor/api/auth.dart';
import 'package:instant_doctor/api/specialty.dart';
import 'package:instant_doctor/model/speciality.dart';
import 'package:instant_doctor/screen/Settings/setting_screen.dart';
import 'package:instant_doctor/screen/auth/login.dart';
import 'package:instant_doctor/screen/doctor_list/doctor_list.dart';
import 'package:instant_doctor/static/button.dart';
import 'package:instant_doctor/static/drop_down.dart';
import 'package:instant_doctor/static/roundedbutton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> specialities = [];
  Speciality? speciality;

  getspeciality() async {
    specialities = [];
    var mspecialities = await SpecialityApi.getspecialities();
    setState(() {
      specialities = mspecialities;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getspeciality();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xFF34607B)),
                        borderRadius: BorderRadius.circular(90),
                      ),
                      child: Image.asset('assets/images/Icon.png')),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Welcome!',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'Instant Dr.',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      'How is it going today?',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: Colors.black),
                    )
                  ],
                ),
                Image.asset(
                  'assets/images/doctor.png',
                  height: 233,
                ),
              ],
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.3, color: Color(0xFF34607B)),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Search Doctor By Speciality',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                      DropdownField(
                        text: 'Choose Speciality',
                        selectedvalue: speciality,
                        items: specialities.toList(),
                        onChange: (value) {
                          setState(() {
                            speciality = value;
                          });
                        },
                      ),
                      SizedBox(height: 14),
                      Center(
                        child: LargeButtons(
                          title: 'Find Doctor',
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DoctorList(
                                    id: speciality!.id!,
                                    name: speciality!.name!)));
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Our Services',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                      LargeButtonss(
                        title: 'My Appointments',
                        icon: Icons.arrow_circle_right_rounded,
                        onPressed: () {},
                      ),
                      LargeButtonss(
                        title: 'Settings',
                        icon: Icons.settings,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SettingScreen()));
                        },
                      ),
                      LargeButtonss(
                        title: 'Logout',
                        icon: Icons.logout_outlined,
                        onPressed: () async {
                          await AuthApi.logout();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (Route<dynamic> route) => false);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
