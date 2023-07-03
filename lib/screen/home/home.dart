// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:instant_doctor/api/auth.dart';
import 'package:instant_doctor/api/specialty.dart';
import 'package:instant_doctor/model/city.dart';
import 'package:instant_doctor/model/speciality.dart';
import 'package:instant_doctor/screen/Settings/profile/edit_profile.dart';
import 'package:instant_doctor/screen/ambulance_screen/ambulance_screen.dart';
import 'package:instant_doctor/screen/appointment/appointment.dart';
import 'package:instant_doctor/screen/auth/login.dart';
import 'package:instant_doctor/screen/doctor_list/doctor_list.dart';
import 'package:instant_doctor/static/button.dart';
import 'package:instant_doctor/static/drop_down.dart';
import 'package:instant_doctor/static/roundedbutton.dart';
import 'package:instant_doctor/static/city_dropdown.dart';
import 'package:instant_doctor/values/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> specialities = [];
  List<dynamic> cities = [];
  Speciality? speciality;
  City? city;

  getspeciality() async {
    specialities = [];
    var mspecialities = await SpecialityApi.getspecialities();
    setState(() {
      speciality = null;
      specialities = mspecialities;
    });
  }

  getcity() async {
    cities = [];
    var mcities = await SpecialityApi.getcities();
    setState(() {
      cities = mcities;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getcity();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: mainColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/doctor.png',
                    height: 70,
                  ),
                  Text(
                    'Instant Dr',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('My Appointments',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Icon(Icons.arrow_circle_right_rounded)
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Appointment()));
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Profile',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Icon(Icons.person_outlined)
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfile()));
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ambulances',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Icon(Icons.warning_amber_outlined)
                ],
              ),
              onTap: () async {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AmbulanceScreen()));
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Logout',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Icon(Icons.logout_outlined)
                ],
              ),
              onTap: () async {
                await AuthApi.logout();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [],
            ),
            SizedBox(
              height: 12,
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
                        'Search Doctor By City & Speciality',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                      CityDropdownField(
                        text: 'Choose City',
                        selectedvalue: city,
                        items: cities.toList(),
                        onChange: (value) {
                          setState(() {
                            city = value;
                            specialities = [];
                          });
                          getspeciality();
                        },
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
                            if (city == null) {
                              Fluttertoast.showToast(
                                  msg: "Select City To find Doctor");
                            } else {
                              if (speciality == null) {
                                Fluttertoast.showToast(
                                    msg: "Select Speciality To find Doctor");
                              } else {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DoctorList(
                                        id: speciality!.id!,
                                        name: speciality!.name!,
                                        cityName: city!.name!,
                                        cityId: city!.id!)));
                              }
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 20),
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
