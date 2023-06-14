// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'package:instant_doctor/api/api.dart';
import 'package:instant_doctor/helpers/loading.dart';
import 'package:instant_doctor/model/doctor.dart';
import 'package:instant_doctor/model/speciality.dart';
import 'package:instant_doctor/values/url.dart';

class SpecialityApi {
  static getspecialities() async {
    LoadingHelper.show();
    var url = BASE_URL + 'doctorspeciality';
    var response = await Api.execute(url: url);
    print(response);

    List<Speciality> specialities = <Speciality>[];
    for (var speciality in response['specialities']) {
      specialities.add(Speciality(speciality));
    }
    LoadingHelper.dismiss();
    return specialities;
  }

  static getdoctor(id) async {
    LoadingHelper.show();
    var url = BASE_URL + 'doctor/get';
    var data = {'id': id};
    var response = await Api.execute(url: url, data: data);
    print(response['doctor']);
    List<Doctor> doctors = <Doctor>[];
    for (var doctor in response['doctor']) {
      doctors.add(Doctor(doctor));
    }
    LoadingHelper.dismiss();
    return doctors;
  }
}
