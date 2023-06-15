import 'dart:convert';

class Doctor {
  int? id;
  String? name;
  String? email;
  String? apiToken;
  String? phone;
  String? image;
  String? location;
  String? end_time;
  String? start_time;
  Map<String, bool>? days;
  bool? isMondayAvailable;
  bool? isTuesdayAvailable;
  bool? isWednesdayAvailable;
  bool? isThursdayAvailable;
  bool? isFridayAvailable;
  bool? isSaturdayAvailable;
  bool? isSundayAvailable;

  Doctor(doctor) {
    id = doctor['id'];
    name = doctor['name'];
    start_time = doctor['start_time'];
    apiToken = doctor['api_token'] ?? '';
    end_time = doctor['end_time'];
    image = doctor['image'];
    location = doctor['address'];
    days = Map<String, bool>.from(doctor['days'] ?? {});
    if (days != null) {
      isMondayAvailable = days!['monday'] ?? false;
      isTuesdayAvailable = days!['tuesday'] ?? false;
      isWednesdayAvailable = days!['wednesday'] ?? false;
      isThursdayAvailable = days!['thursday'] ?? false;
      isFridayAvailable = days!['friday'] ?? false;
      isSaturdayAvailable = days!['saturday'] ?? false;
      isSundayAvailable = days!['sunday'] ?? false;
    }
  }
}
