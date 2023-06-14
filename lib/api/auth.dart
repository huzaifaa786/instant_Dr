// ignore_for_file: unused_local_variable, prefer_interpolation_to_compose_strings, avoid_print, prefer_typing_uninitialized_variables

import 'package:fluttertoast/fluttertoast.dart';
import 'package:instant_doctor/api/api.dart';
import 'package:instant_doctor/helpers/loading.dart';
import 'package:instant_doctor/helpers/shared_pref.dart';
import 'package:instant_doctor/model/User.dart';
import 'package:instant_doctor/values/url.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class AuthApi {
  static login(email, password) async {
    LoadingHelper.show();
    var url = BASE_URL + 'patient/login';
    // var token = await FirebaseMessaging.instance.getToken();
    var data = {
      'email': email,
      'password': password,
      // 'firebase_token': token,
    };

    var response = await Api.execute(url: url, data: data);
    print(response);
    LoadingHelper.dismiss();
    if (!response['error']) {
      User user = User(response['user']);
      SharedPreferencesHelper.setString('api_token', user.apiToken!);
      return true;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }

  static register(name, email, phone, password) async {
    LoadingHelper.show();
    // var token = await FirebaseMessaging.instance.getToken();
    var url = BASE_URL + 'register';
    var data;
    data = {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      // 'firebase_token': token,
    };

    var response = await Api.execute(
      url: url,
      data: data,
    );
    print(response);
    LoadingHelper.dismiss();
    if (!response['error']) {
      User user = User(response['user']);
      SharedPreferencesHelper.setString('api_token', user.apiToken!);
      return true;
    } else {
      print('error');
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }

  // static getuser() async {
  //   LoadingHelper.show();
  //   var url = BASE_URL + 'getuser';
  //   var data;
  //   final prefs = await SharedPreferences.getInstance();
  //   print(prefs.getString('api_token'));
  //   data = {'api_token': prefs.getString('api_token')!};

  //   var response = await Api.execute(url: url, data: data);
  //   LoadingHelper.dismiss();
  //   if (!response['error']) {
  //     User? user = User(response['user']);
  //     print(user);
  //     return user;
  //   } else {
  //     Fluttertoast.showToast(msg: response['error_data']);
  //     return false;
  //   }
  // }

  // static getorder() async {
  //   LoadingHelper.show();
  //   var url = BASE_URL + 'getuserorder';
  //   var data;
  //   final prefs = await SharedPreferences.getInstance();
  //   print('object');
  //   print(prefs.getString('user_id'));
  //   data = {'id': prefs.getString('user_id')!};

  //   var response = await Api.execute(url: url, data: data);
  //   LoadingHelper.dismiss();
  //   if (!response['error']) {
  //     List<OrderModal> orders = <OrderModal>[];
  //     for (var order in response['orders']) {
  //       orders.add(OrderModal(order));
  //     }
  //     return orders;
  //   } else {
  //     Fluttertoast.showToast(msg: response['error_data']);
  //     return false;
  //   }
  // }

  static Future logout() async {
    SharedPreferencesHelper.remove('api_token');
  }
}
