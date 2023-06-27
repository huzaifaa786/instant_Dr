import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:instant_doctor/static/topbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instant_doctor/static/button.dart';
import 'package:instant_doctor/values/colors.dart';

class DoctorList extends StatefulWidget {
  const DoctorList({super.key});

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Topbar(),
          ),
          Container(padding: EdgeInsets.only(left: 8,top: 35),
            margin: EdgeInsets.only( bottom: 30),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orangeAccent,
                  ),
                  child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SvgPicture.asset(
                        'assets/images/dentistVector.svg',
                        height: 33,
                        width: 33,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'Denist',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 23),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Doctor in Sargodha',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Color.fromARGB(255, 29, 132, 33)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.33,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(),
                  boxShadow: [
                    BoxShadow(
                      color: mainColor,
                      blurRadius: 1.0,
                      spreadRadius: 4,
                      offset: Offset(-8.0, 0),
                    ),
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1.0,
                      spreadRadius: 1,
                      offset: Offset(0, 2),
                    ),
                     BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1.0,
                      spreadRadius: 1,
                      offset: Offset(0, -2),
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(top: 5, left: 10, right: 5),
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
                        Text(
                          'Mon-Thu  ',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        Icon(
                          Icons.circle,
                          size: 7,
                        ),
                        Text(
                          '  10:00AM - 03:30pM',
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
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: Colors.black45),
                              child: Image.asset(
                                'assets/images/doctor.png',
                                height: 50,
                                width: 50,
                                fit: BoxFit.scaleDown,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dr.Neda Imran',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                'Denist',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                    color: Colors.grey),
                              ),
                              Text(
                                'Sadiq Hospital Sargodha',
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
                      padding: const EdgeInsets.only(left: 23, top: 15),
                      child: LargeButtons(
                        title: 'Get Appointment Now',
                        color: mainColor,
                        screenRatio: 0.7,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.33,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(),
                  boxShadow: [
                    BoxShadow(
                      color: mainColor,
                      blurRadius: 1.0,
                      spreadRadius: 4,
                      offset: Offset(-8.0, 0),
                    ),
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1.0,
                      spreadRadius: 1,
                      offset: Offset(0, 2),
                    ),
                     BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1.0,
                      spreadRadius: 1,
                      offset: Offset(0, -2),
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(top: 5, left: 10, right: 5),
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
                        Text(
                          'Mon-Thu  ',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        Icon(
                          Icons.circle,
                          size: 7,
                        ),
                        Text(
                          '  10:00AM - 03:30pM',
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
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: Colors.black45),
                              child: Image.asset(
                                'assets/images/doctor.png',
                                height: 50,
                                width: 50,
                                fit: BoxFit.scaleDown,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dr.Neda Imran',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                'Denist',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                    color: Colors.grey),
                              ),
                              Text(
                                'Sadiq Hospital Sargodha',
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
                      padding: const EdgeInsets.only(left: 23, top: 15),
                      child: LargeButtons(
                        title: 'Get Appointment Now',
                        color: mainColor,
                        screenRatio: 0.7,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
