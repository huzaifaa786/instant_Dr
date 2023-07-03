// ignore_for_file: file_names

class Appointments {
  int? id;
  String? drName;
  String? speciality;
  String? fee;
  String? hospital;
  String? image;

  Appointments(appointments) {
    id = appointments['id'];
    drName = appointments['doctor']['name'];
    image = appointments['doctor']['image'];
    speciality = appointments['doctor']['speciality']['name'];
    fee = appointments['doctor']['fee'];
    hospital = appointments['hospital']['name'];
  }
}
