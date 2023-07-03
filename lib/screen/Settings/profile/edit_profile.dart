// ignore_for_file: prefer_const_constructors, unused_element, prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:instant_doctor/api/api.dart';
import 'package:instant_doctor/api/auth.dart';
import 'package:instant_doctor/helpers/loading.dart';
import 'package:instant_doctor/model/User.dart';
import 'package:instant_doctor/screen/Settings/profile/edit_model.dart';
import 'package:instant_doctor/screen/Settings/profile/succesfully_update.dart';
import 'package:instant_doctor/static/button.dart';
import 'package:instant_doctor/static/inputfield2.dart';
import 'dart:ui' as ui;
import 'package:instant_doctor/static/topbar.dart';
import 'package:instant_doctor/values/colors.dart';
import 'package:instant_doctor/values/url.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  User? user;

  EditProfile(void Function(bool) callback) async {
    LoadingHelper.show();
    var url = BASE_URL + 'user/update';
    final prefs = await SharedPreferences.getInstance();

    var data = {
      'api_token': prefs.getString('api_token'),
      'name': nameController.text.toString(),
    };
    var response = await Api.execute(url: url, data: data);
    LoadingHelper.dismiss();
    if (!response['error']) {
      user = User(response['user']);
      setState(() {});
      return callback(true);
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return callback(false);
    }
  }

  getuser() async {
    var muser = await AuthApi.getuser();
    setState(() {
      user = muser;
      nameController.text = user!.name!;
      phoneController.text = user!.phone!;
      emailController.text = user!.email!;
    });
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
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.89,
                      // padding: EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                readOnly: true,
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
                                readOnly: true,
                                hint: 'Enter Mobile Number',
                                controller: phoneController,
                                type: TextInputType.number,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12.0, bottom: 6),
                                child: Text(
                                  "Email",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                              InputFieldTwo(
                                readOnly: true,
                                hint: 'Enter Eamil',
                                controller: emailController,
                                // type: TextInputType.number,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        ChangePassword(context);
                                      },
                                      child: Text(
                                        "Change Password",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: mainColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30),
                              // LargeButtons(
                              //   title: 'Update',
                              //   onPressed: () {
                              //     EditProfile((success) {
                              //       if (success) {
                              //         Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //               builder: (context) =>
                              //                   BookingConfirm()),
                              //         );
                              //       }
                              //     });
                              //   },
                              //   color: mainColor,
                              //   screenRatio: 0.95,
                              // )
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

  ChangePassword(context) {
    Alert(context: context, content: EditModel(), buttons: [
      DialogButton(
          height: 0,
          color: Colors.white,
          onPressed: () async {},
          child: Text(''))
    ]).show();
  }
}
