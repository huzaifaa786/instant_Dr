import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.only(top:12.0,right: 15,left: 15),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Topbar(),
              SettingTile(text: 'My Profile',ontap: (){},),
              // SettingTile(text: 'My Profile',ontap: (){},),
              SettingTile(text: 'Privacy',ontap: (){},),
              SettingTile(text: 'About Us',ontap: (){},),
              SettingTile(text: 'Logout',ontap: (){},),

            ],
          ),
        ),
      ),
    );
  }
}
