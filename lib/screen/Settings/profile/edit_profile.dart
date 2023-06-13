// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:instant_doctor/screen/Settings/profile/succesfully_update.dart';
import 'package:instant_doctor/static/button.dart';
import 'package:instant_doctor/static/inputField.dart';
import 'package:instant_doctor/static/inputfield2.dart';
import 'dart:ui' as ui;
// import 'package:instant_doctor/static/';
import 'package:instant_doctor/static/topbar.dart';
import 'package:instant_doctor/values/colors.dart';

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
            padding: EdgeInsets.only(left: 20, right: 20, top: 12.0),
            child: Column(
              children: [
                Topbar(),
                Flexible(
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.89,
                      // padding: EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey[200]!),
                                          borderRadius:
                                              BorderRadius.circular(55)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(55),
                                        child: const Image(
                                          image: AssetImage(
                                              'assets/images/5907.jpg'),
                                          height: 110,
                                          width: 110,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      child: Icon(Icons.photo_camera_rounded),
                                      bottom: 3,
                                      right: 6,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15.0, bottom: 6),
                                child: Text(
                                  "Name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                              InputFieldTwo(
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
                              InputFieldTwo(
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
                              InputFieldTwo(
                                // readOnly: true,
                                hint: 'Enter Location',
                                controller: locationController,
                                // type: TextInputType.number,
                              ),
                              SizedBox(height: 30),
                              LargeButtons(
                                title: 'Update',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BookingConfirm()),
                                  );
                                },
                                color: mainColor,
                                screenRatio: 0.95,
                              )
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
