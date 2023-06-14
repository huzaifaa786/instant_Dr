// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instant_doctor/api/auth.dart';
import 'package:instant_doctor/model/User.dart';
import 'package:instant_doctor/screen/Settings/profile/edit_profile.dart';
import 'package:instant_doctor/static/setting_tile.dart';
import 'package:instant_doctor/static/topbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  User? user;
  getuser() async {
    final prefs = await SharedPreferences.getInstance();
    String? authCheck = prefs.getString('api_token');
    if (authCheck != null) {
      var muser = await AuthApi.getuser();
      setState(() {
        user = muser;
      });
    } else {
      print('object');
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getuser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: user != null
            ? Container(
                padding: const EdgeInsets.only(top: 12.0, right: 20, left: 20),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Topbar(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(55),
                      child: user!.image == ''
                          ? Image(
                              image: AssetImage('assets/images/5907.jpg'),
                              height: 110,
                              width: 110,
                            )
                          : Image(
                              image: NetworkImage(user!.image!),
                              height: 110,
                              width: 110,
                            ),
                    ),
                   Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 25),
                      child: Text(
                        user!.name!,
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SettingTile(
                      text: 'My Profile',
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfile()),
                        );
                      },
                    ),
                    // SettingTile(text: 'My Profile',ontap: (){},),
                    SettingTile(
                      text: 'Privacy',
                      ontap: () {},
                    ),
                    SettingTile(
                      text: 'About Us',
                      ontap: () {},
                    ),
                    SettingTile(
                      text: 'Logout',
                      ontap: () {
                        showAlertDialog(context);
                      },
                    ),
                  ],
                ),
              )
            : Container(),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: const Text("Are You Sure want to logout?"),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: const Text("YES"),
              onPressed: () {},
            ),
            TextButton(
              child: const Text("No"),
              onPressed: () {},
            )
          ],
        )
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
