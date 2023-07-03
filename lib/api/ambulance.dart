// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:instant_doctor/api/api.dart';
import 'package:instant_doctor/helpers/loading.dart';
import 'package:instant_doctor/model/ambulance.dart';
import 'package:instant_doctor/values/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AmbulanceApi {
    static getAmbulance() async {
    LoadingHelper.show();
    var url = BASE_URL + 'all/ambulance';
    var response = await Api.execute(url: url);
    List<Ambulance> ambulance = <Ambulance>[];
    for (var ambulances in response['ambulance']) {
      ambulance.add(Ambulance(ambulances));
    }
    LoadingHelper.dismiss();
    return ambulance;
  }
}
