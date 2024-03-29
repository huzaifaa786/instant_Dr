// ignore_for_file: prefer_typing_uninitialized_variables, deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instant_doctor/values/colors.dart';



class LargeButtons extends StatelessWidget {
  const LargeButtons(
      {Key? key,
      @required this.title,
      @required this.onPressed,
      this.textcolor,
      this.icon,
      this.buttonWidth = 0.8,
      this.screenRatio = 0.9,
      this.rounded = false,
      this.color })
      : super(key: key);

  final title;
  final onPressed;
  final screenRatio;
  final color;
  final textcolor;
  final icon;
  final rounded;
  final buttonWidth;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * screenRatio,
        height: 60,
        child: Container(
          decoration: BoxDecoration(
              color: mainColor,
             ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
