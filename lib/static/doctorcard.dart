// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:instant_doctor/static/button.dart';
import 'package:instant_doctor/values/colors.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard(
      {super.key,
      this.days,
      this.time,
      this.image,
      this.name,
      this.add,
      this.speciality,
      this.ontap});
  final days;
  final time;
  final image;
  final name;
  final speciality;
  final add;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.circular(),
            boxShadow: [
              BoxShadow(
                color: mainColor,
                spreadRadius: 6,
                offset: Offset(-8.0, 0),
              ),
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 6,
                offset: Offset(0, 1),
              ),
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 8,
                offset: Offset(0, 2),
              ),
              BoxShadow(
                color: Colors.white,
                // blurRadius: 1.0,
                spreadRadius: 8,
                offset: Offset(0, -2),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 10, right: 5, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  'Date & Timing',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      color: Colors.grey),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(Icons.access_time_rounded),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      days,
                      maxLines: null,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.circle,
                    size: 7,
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey[200],
                thickness: 1.5,
              ),
              Row(
                children: [
                  Column(children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10), child: image)
                  ]),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr.' + name,
                          maxLines: null,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          speciality,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Colors.grey),
                        ),
                        Text(
                          add,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: LargeButtons(
                  title: 'Get Appointment Now',
                  color: mainColor,
                  screenRatio: 0.99,
                  onPressed: ontap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
