// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:instant_doctor/api/api.dart';
import 'package:instant_doctor/helpers/loading.dart';
import 'package:instant_doctor/model/appointments.dart';
import 'package:instant_doctor/values/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderApi {
  static placeorder(date, time, doctorId, patientName, hospitalId, fee) async {
    LoadingHelper.show();
    var url = BASE_URL + 'order/store';
    final prefs = await SharedPreferences.getInstance();
    var data = {
      'user_id': prefs.getInt('id'),
      'doctor_id': doctorId,
      'patientname': patientName,
      'time': time,
      'date': date,
      'hospital_id': hospitalId,
      'fees': fee,
    };
    var response = await Api.execute(url: url, data: data);
    LoadingHelper.dismiss();

    if (!response['error']) {
      return true;
    } else {
      return false;
    }
  }

    static getAppointments() async {
    LoadingHelper.show();
    var url = BASE_URL + 'order/get';
    final prefs = await SharedPreferences.getInstance();
    var data = {
      'id': prefs.getInt('id'),
    };
    var response = await Api.execute(url: url, data: data);
    print(response['order']);
    List<Appointments> appointment = <Appointments>[];
    for (var doctor in response['order']) {
      appointment.add(Appointments(doctor));
    }
    LoadingHelper.dismiss();
    return appointment;
  }
}
