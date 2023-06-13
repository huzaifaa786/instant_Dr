import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Topbar extends StatelessWidget {
  const Topbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: FittedBox(fit: BoxFit.scaleDown,child: SvgPicture.asset('assets/images/backArrow.svg',height: 30)),
        ),
      ],
    );
  }
}
