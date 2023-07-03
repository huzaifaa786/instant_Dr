// ignore_for_file: file_names

class Ambulance {
  int? id;
  String? name;
  String? phone;
  String? image;

  Ambulance(ambulance) {
    id = ambulance['id'];
    name = ambulance['name'];
    image = ambulance['image'];
    phone = ambulance['phone'];
  }
}
