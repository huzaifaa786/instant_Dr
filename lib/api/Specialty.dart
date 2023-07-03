// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'package:instant_doctor/api/api.dart';
import 'package:instant_doctor/helpers/loading.dart';
import 'package:instant_doctor/model/city.dart';
import 'package:instant_doctor/model/doctor.dart';
import 'package:instant_doctor/model/speciality.dart';
import 'package:instant_doctor/values/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpecialityApi {
  static getspecialities() async {
    LoadingHelper.show();
    var url = BASE_URL + 'doctorspeciality';
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getString('api_token'));
    var data = {'api_token': prefs.getString('api_token')};

    var response = await Api.execute(url: url, data: data);
    print(response);

    List<Speciality> specialities = <Speciality>[];
    for (var speciality in response['specialities']) {
      specialities.add(Speciality(speciality));
    }
    LoadingHelper.dismiss();
    return specialities;
  }

  static getcities() async {
    LoadingHelper.show();
    var url = BASE_URL + 'all/city';
    var response = await Api.execute(url: url);
    print(response);

    List<City> cities = <City>[];
    for (var city in response['citys']) {
      cities.add(City(city));
    }
    LoadingHelper.dismiss();
    return cities;
  }

  static getdoctor(id, cityId) async {
    LoadingHelper.show();
    var url = BASE_URL + 'doctor/get';
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getString('api_token'));
    var data = {
      'id': id,
      'city_id': cityId,
      'api_token': prefs.getString('api_token')
    };
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
