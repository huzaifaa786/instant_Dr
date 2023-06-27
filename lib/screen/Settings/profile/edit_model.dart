import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui' as ui;

import 'package:instant_doctor/api/auth.dart';
import 'package:instant_doctor/screen/home/home.dart';
import 'package:instant_doctor/static/button.dart';
import 'package:instant_doctor/static/inputfield.dart';

class EditModel extends StatefulWidget {
  const EditModel({Key? key}) : super(key: key);
  @override
  State<EditModel> createState() => _EditModelState();
}

class _EditModelState extends State<EditModel> {
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();
  bool _passwordVisible = true;
  bool _newpasswordVisible = true;
  bool _cpasswordVisible = true;

  void _toggle() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void _toggle1() {
    setState(() {
      _newpasswordVisible = !_newpasswordVisible;
    });
  }

  void _toggle2() {
    setState(() {
      _cpasswordVisible = !_cpasswordVisible;
    });
  }

  change() async {
    if (currentPassword.text == '' ||
        newPassword.text == '' ||
        confirmNewPassword.text == '') {
      Fluttertoast.showToast(msg: 'Fill out all the Fields. Invalid!');
    } else {
      if (newPassword.text != confirmNewPassword.text) {
        Fluttertoast.showToast(msg: 'New and Confirm password must be same');
      } else {
        if (await AuthApi.changeposward(
          currentPassword,
          newPassword,
        )) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false);

          currentPassword.text = '';
          newPassword.text = '';
          confirmNewPassword.text = '';
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 6),
          Text(
            'Current_Password',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          SizedBox(height: 4),
          InputField(
            hint: 'Enter current password',
            obscure: true,
            controller: currentPassword,
          ),
          SizedBox(height: 6),
          Text(
            "New Password",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          SizedBox(height: 4),
          InputField(
            hint: "Enter_new_password",
            obscure: true,
            controller: newPassword,
          ),
          SizedBox(height: 6),
          Text(
            'Confirm New Password',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          SizedBox(height: 4),
          InputField(
            hint: 'Enter confirm new password',
            obscure: _cpasswordVisible,
            controller: confirmNewPassword,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: LargeButtons(
              title: "Change",
              onPressed: () async {
                await change();
              },
            ),
          )
        ],
      ),
    );
  }
}
