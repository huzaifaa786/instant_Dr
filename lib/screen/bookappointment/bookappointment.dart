// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:instant_doctor/static/topbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instant_doctor/static/button.dart';
import 'package:instant_doctor/values/colors.dart';
import 'package:date_time_picker/date_time_picker.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({super.key});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  String valueChanged4 = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Topbar(),
            ),
            Container(
              padding: EdgeInsets.only(left: 8, top: 35),
              margin: EdgeInsets.only(bottom: 30),
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
                  Container(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      'Book Appointment',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          color: Color.fromARGB(255, 29, 132, 33)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: mainColor,
                        blurRadius: 0.0,
                        spreadRadius: 4,
                        offset: Offset(-8.0, 0),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 1.0,
                        spreadRadius: 4,
                        offset: Offset(0, 2),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 1.0,
                        spreadRadius: 4,
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Row(
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Divider(
                          color: Colors.grey[200],
                          thickness: 1.5,
                        ),
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
                                Text(
                                  'Fee:RS 1300',
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
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Colors.red,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.79,
                                child: Text(
                                    "Sadiq Hospital Satellite Town Sargodha, Pakistan")),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Select Date And Time:',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          DateTimePicker(
                            decoration: InputDecoration(
                                filled: true, //<-- SEE HERE
                                fillColor: Colors.grey[200],
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                                border: InputBorder.none,
                                hintText: 'Select Date For Consultation'),
                            type: DateTimePickerType.date,
                            dateMask: 'd MMM, yyyy',
                            // initialValue: DateTime.now().toString(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            icon: Icon(Icons.event),
                            dateLabelText: 'Date',
                            timeLabelText: "Time",
              
                            selectableDayPredicate: (date) {
                              if (date.weekday == 6 || date.weekday == 7) {
                                return false;
                              }
                              return true;
                            },
                            onChanged: (val) => print(val),
                            validator: (val) {
                              print(val);
                              return null;
                            },
                            onSaved: (val) => print(val),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10,bottom: 10),
                            child: DateTimePicker(
                              type: DateTimePickerType.time,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.keyboard_arrow_down),
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  hintText: 'Select Time For Consultation'),
                              initialValue: '',
                              timeLabelText: "Time",
                              onChanged: (val) {
                                setState(() => valueChanged4 = val);
                                print(valueChanged4);
                              },
                              validator: (val) {
                                return null;
                              },
                              onSaved: (val) {
                                print(val);
                              },
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 238, 237, 237),
                                border: InputBorder.none,
                                hintText: 'Enter Patient Name'),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 23, top: 15),
                        child: LargeButtons(
                          title: 'Book Appointment',
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
        ),
      )),
    );
  }
}
