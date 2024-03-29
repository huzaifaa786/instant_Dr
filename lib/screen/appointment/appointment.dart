// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instant_doctor/api/order.dart';
import 'package:instant_doctor/model/appointments.dart';
import 'package:instant_doctor/static/appointmentCard.dart';
import 'package:instant_doctor/static/topbar.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  List<Appointments> appointments = [];
  getAppointments() async {
    var mappointments = await OrderApi.getAppointments();
    setState(() {
      appointments = mappointments;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getAppointments();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Column(
          children: [
            Topbar(),
            SizedBox(height: 8),
            Flexible(
              child: SizedBox(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: appointments.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AppointmentCard(
                        image: appointments[index].image == null
                            ? Image.asset(
                                'assets/images/5907.jpg',
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                              )
                            : Image(
                                image: NetworkImage(appointments[index].image!),
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover),
                        drName: appointments[index].drName,
                        speciality: appointments[index].speciality,
                        fee: appointments[index].fee,
                        hospital: appointments[index].hospital,
                      );
                    }),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
