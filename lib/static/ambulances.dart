// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class AmbulanceCard extends StatelessWidget {
  const AmbulanceCard({super.key, this.name, this.ontap, this.image});
  final name;
  final ontap;
  final image;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(10), child: image),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            InkWell(onTap: ontap,child: Icon(Icons.phone))
          ],
        ),
        Divider()
      ],
    );
  }
}
