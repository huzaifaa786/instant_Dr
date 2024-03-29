// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, prefer_interpolation_to_compose_strings, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:instant_doctor/api/order.dart';
import 'package:instant_doctor/api/strip.dart';
import 'package:instant_doctor/helpers/loading.dart';
import 'package:instant_doctor/helpers/shared_pref.dart';
import 'package:instant_doctor/model/doctor.dart';
import 'package:instant_doctor/screen/bookappointment/order_placed.dart';
import 'package:instant_doctor/static/topbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instant_doctor/static/button.dart';
import 'package:instant_doctor/values/colors.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({super.key, required this.doctor, required this.name});
  final Doctor doctor;
  final String name;

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  String valueChanged4 = '';
  String? intent;
  String? date = '';
  TextEditingController nameController = TextEditingController();

  paayment() async {
    LoadingHelper.show();

    var data = await StripeApi.paymentIntent(int.parse(widget.doctor.fee!));
    setState(() {
      intent = data['intent']['id'];
    });
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: data['paymentIntent'],
        merchantDisplayName: 'IntantDoctor',
        // customFlow: true,
        // Customer params
        // customerId: data['customer'].toString(),
        // customerEphemeralKeySecret: data['ephemeralKey'].toString(),
        // Extra params
        applePay: PaymentSheetApplePay(merchantCountryCode: 'Pk'),
        googlePay: PaymentSheetGooglePay(
          merchantCountryCode: 'Pk',
          currencyCode: 'PKR',
          testEnv: true,
        ),
        style: ThemeMode.dark,
        // customFlow: true
        // billingDetails: billingDetails,
      ),
    );
    LoadingHelper.dismiss();
    confirmPayment();
  }

  Future<bool> confirmPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      print('object');
      orderPlaced();
      Fluttertoast.showToast(msg: 'Payment succesfully completed');
      return true;
    } on Exception catch (e) {
      if (e is StripeException) {
        Fluttertoast.showToast(
            msg: 'Error from Stripe: ${e.error.localizedMessage}');
        return false;
      } else {
        Fluttertoast.showToast(msg: 'Unforeseen error: ${e}');
        return false;
      }
    }
  }

  orderPlaced() async {
    if (await OrderApi.placeorder(
      date,
      valueChanged4,
      widget.doctor.id,
      nameController.text.toString(),
      widget.doctor.hospital_id,
      widget.doctor.fee!,
    )) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OrderBooked()),
      );
    } else {
      Fluttertoast.showToast(msg: 'Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    String mon = widget.doctor.isMondayAvailable == false ? '' : "Mon, ";
    String tuesday = widget.doctor.isTuesdayAvailable == false ? '' : "Tue, ";
    String wed = widget.doctor.isWednesdayAvailable == false ? '' : "Wed, ";
    String thursday =
        widget.doctor.isThursdayAvailable == false ? '' : "Thur, ";
    String friday = widget.doctor.isFridayAvailable == false ? '' : "Fri, ";
    String sat = widget.doctor.isSaturdayAvailable == false ? '' : "Sat, ";
    String sunday = widget.doctor.isSundayAvailable == false ? '' : "Sun";
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
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.32,
                              child: Text(
                                mon +
                                    tuesday +
                                    wed +
                                    thursday +
                                    friday +
                                    sat +
                                    sunday,
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
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: Text(
                                widget.doctor.start_time.toString() +
                                    ' | ' +
                                    widget.doctor.end_time.toString(),
                                maxLines: null,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                ),
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: widget.doctor.image == null
                                    ? Image.asset(
                                        'assets/images/5907.jpg',
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.cover,
                                      )
                                    : Image(
                                        image:
                                            NetworkImage(widget.doctor.image!),
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.cover),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dr.' + widget.doctor.name!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                  ),
                                ),
                                Text(
                                  widget.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                      color: Colors.grey),
                                ),
                                Text(
                                  widget.doctor.location!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                      color: Colors.grey),
                                ),
                                Text(
                                  'Fee:RS ' + widget.doctor.fee!,
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
                                child: Text(widget.doctor.location!)),
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
                                filled: true,
                                fillColor: Colors.grey[200],
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                                border: InputBorder.none,
                                hintText: 'Select Date For Consultation'),
                            type: DateTimePickerType.date,
                            // dateMask: 'dd MMM, yyyy',
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                            icon: Icon(Icons.event),
                            dateLabelText: 'Date',
                            timeLabelText: "Time",
                            selectableDayPredicate: (date) {
                              return true;
                            },
                            onChanged: (val) {
                              date = val;
                              setState(() {
                                print(date);
                              });
                            },
                            validator: (val) {
                              print(val);
                              return null;
                            },
                            onSaved: (val) => print(val),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                            controller: nameController,
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
                          onPressed: () async {
                            if (date != '') {
                              if (valueChanged4 != '') {
                                if (nameController.text.isNotEmpty) {
                                  setState(() {});
                                  await paayment();
                                } else {
                                  Fluttertoast.showToast(
                                      msg: 'Patient Name Required');
                                }
                              } else {
                                Fluttertoast.showToast(msg: 'Time Required');
                              }
                            } else {
                              Fluttertoast.showToast(msg: 'Date Required');
                            }
                          },
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
