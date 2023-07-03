// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instant_doctor/static/button.dart';
import 'dart:ui' as ui;

import 'package:instant_doctor/static/topbar.dart';

class OrderBooked extends StatefulWidget {
  const OrderBooked({super.key});

  @override
  State<OrderBooked> createState() => _OrderBookedState();
}

class _OrderBookedState extends State<OrderBooked> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 12),
            child: Column(
              children: [
                Topbar(),
                Container(
                  height: MediaQuery.of(context).size.height*0.88,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/success.svg'),
                      Padding(
                          padding: EdgeInsets.only(
                            top: 30,
                          ),
                          child: Text(
                            'Congratulations',
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w700),
                          )),
                      Container(
                        padding: EdgeInsets.only(top: 30),
                        width: MediaQuery.of(context).size.width *0.7,
                        child: Text(
                          'Your Order has placed succesfully',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 23,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: LargeButtons(
                          title: 'Back to home',
                          screenRatio: 0.75,
                          onPressed: () {
                            Navigator.pushNamed(context, 'home');
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
