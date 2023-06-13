// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({super.key, this.text, this.ontap});
  final text;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
