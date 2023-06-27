// ignore_for_file: prefer_typing_uninitialized_variables, deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';



class LargeButtonss extends StatelessWidget {
  const LargeButtonss(
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
    return Padding(
      padding: const EdgeInsets.only(top: 15,),
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * screenRatio,
          height: 60,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.only(left: 19,right: 19),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: textcolor,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    Icon(icon),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
