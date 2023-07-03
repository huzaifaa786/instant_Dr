// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:instant_doctor/api/specialty.dart';
import 'package:instant_doctor/model/doctor.dart';
import 'package:instant_doctor/screen/bookappointment/bookappointment.dart';
import 'package:instant_doctor/static/doctorcard.dart';
import 'package:instant_doctor/static/topbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorList extends StatefulWidget {
  const DoctorList(
      {super.key,
      required this.id,
      required this.name,
      required this.cityName,
      required this.cityId});
  final int id;
  final String name;
  final String cityName;
  final int cityId;

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  List<Doctor> doctors = [];
  getdoctors(id, cityId) async {
    var mDoctors = await SpecialityApi.getdoctor(id, cityId);
    setState(() {
      doctors = mDoctors;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getdoctors(widget.id, widget.cityId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 12),
        child: Column(
          children: [
            Topbar(),
            Container(
              margin: EdgeInsets.only(top: 50, bottom: 30),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orangeAccent,
                    ),
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SvgPicture.asset(
                          'assets/images/dentistVector.svg',
                          height: 24,
                          width: 24,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 23),
                        ),
                        Text(
                          'Doctor in ' +  widget.cityName,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Color.fromARGB(255, 29, 132, 33)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.68,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: doctors.length,
                  itemBuilder: (BuildContext context, int index) {
                    String mon = doctors[index].isMondayAvailable == false
                        ? ''
                        : "Mon, ";
                    String tuesday = doctors[index].isTuesdayAvailable == false
                        ? ''
                        : "Tue, ";
                    String wed = doctors[index].isWednesdayAvailable == false
                        ? ''
                        : "Wed, ";
                    String thursday =
                        doctors[index].isThursdayAvailable == false
                            ? ''
                            : "Thur, ";
                    String friday = doctors[index].isFridayAvailable == false
                        ? ''
                        : "Fri, ";
                    String sat = doctors[index].isSaturdayAvailable == false
                        ? ''
                        : "Sat, ";
                    String sunday =
                        doctors[index].isSundayAvailable == false ? '' : "Sun";
                    return DoctorCard(
                      time: doctors[index].start_time.toString() +
                          ' | ' +
                          doctors[index].end_time.toString(),
                      days: mon +
                          tuesday +
                          wed +
                          thursday +
                          friday +
                          sat +
                          sunday,
                      image: doctors[index].image == null
                          ? Image.asset(
                              'assets/images/5907.jpg',
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            )
                          : Image(
                              image: NetworkImage(doctors[index].image!),
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover),
                      name: doctors[index].name,
                      add: doctors[index].location,
                      speciality: widget.name,
                      ontap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BookAppointment(
                                doctor: doctors[index], name: widget.name)));
                      },
                    );
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
