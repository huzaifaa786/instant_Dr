// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:instant_doctor/static/inputField.dart';
import 'dart:ui' as ui;
// import 'package:instant_doctor/static/';
import 'package:instant_doctor/static/topbar.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20,top: 12.0),
            child: Column(
              children: [
                Topbar(),
                Flexible(
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.89,
                      padding: EdgeInsets.only(top: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 12.0, bottom: 6),
                                child: Text(
                                  "Name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                              InputField(
                                // readOnly: true,
                                hint: 'Enter name',
                                controller: nameController,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12.0, bottom: 6),
                                child: Text(
                                  "Mobile Number",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                              InputField(
                                // readOnly: true,
                                hint: 'Enter Mobile Number',
                                controller: phoneController,
                                type: TextInputType.number,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12.0, bottom: 6),
                                child: Text(
                                  "Location",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                              InputField(
                                readOnly: true,
                                hint: 'Enter Location',
                                controller: locationController,
                                // type: TextInputType.number,
                              ),
                              LargeButton()
                            ],
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
