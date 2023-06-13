import 'package:instant_doctor/api/api.dart';
import 'package:instant_doctor/model/speciality.dart';
import 'package:instant_doctor/values/url.dart';

class SpecialityApi {
  static getcities() async {
    var url = BASE_URL + 'city/all';
    var response = await Api.execute(url: url);
    print(response);

    List<Speciality> specialities = <Speciality>[];
    for (var speciality in response['cities']) {
      specialities.add(Speciality(speciality));
    }
    return specialities;
  }}