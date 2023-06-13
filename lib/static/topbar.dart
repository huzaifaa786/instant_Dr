import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Topbar extends StatelessWidget {
  const Topbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: SvgPicture.asset('assets/images/backArrow.svg'),
          ),
        ],
      )),
    );
  }
}
