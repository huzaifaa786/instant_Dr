// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instant_doctor/api/ambulance.dart';
import 'package:instant_doctor/model/ambulance.dart';
import 'package:instant_doctor/static/ambulances.dart';
import 'package:instant_doctor/static/topbar.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class AmbulanceScreen extends StatefulWidget {
  const AmbulanceScreen({super.key});

  @override
  State<AmbulanceScreen> createState() => _AmbulanceScreenState();
}

class _AmbulanceScreenState extends State<AmbulanceScreen> {
  List<Ambulance> ambulances = [];
  getAmbulances() async {
    var mambulances = await AmbulanceApi.getAmbulance();
    setState(() {
      ambulances = mambulances;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getAmbulances();
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
                    itemCount: ambulances.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AmbulanceCard(
                        image: ambulances[index].image == null
                            ? Image.asset(
                                'assets/images/5907.jpg',
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                              )
                            : Image(
                                image: NetworkImage(ambulances[index].image!),
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover),
                        name: ambulances[index].name,
                        ontap: () async {
                          await FlutterPhoneDirectCaller.callNumber(
                              ambulances[index].phone!);
                        },
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
