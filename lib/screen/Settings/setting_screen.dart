import 'package:flutter/material.dart';
import 'package:instant_doctor/screen/Settings/profile/edit_profile.dart';
import 'package:instant_doctor/static/setting_tile.dart';
import 'package:instant_doctor/static/topbar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0, right: 15, left: 15),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Topbar(),
              ClipRRect(
                borderRadius: BorderRadius.circular(55),
                child: const Image(
                  image: AssetImage('assets/images/5907.jpg'),
                  height: 110,
                  width: 110,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 12, bottom: 25),
                child: Text(
                  "Sohaib",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                ),
              ),
              SettingTile(
                text: 'My Profile',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfile()),
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
                ontap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
