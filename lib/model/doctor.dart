import 'dart:convert';

class Doctor {
  int? id;
  String? name;
  String? email;
  String? apiToken;
  String? phone;
  String? image;
  String? location;
  String? speciality;
  List<dynamic>? day;

  Doctor(doctor) {
    id = doctor['id'];
    name = doctor['name'];
    speciality = doctor['speciality'];
    email = doctor['email'];
    apiToken = doctor['api_token'] ?? '';
    phone = doctor['phone'];
    image = doctor['image'];
    location = doctor['address'];
    day = jsonDecode(doctor['days']);
  }
}
