class Doctor {
  int? id;
  String? name;
  String? email;
  String? apiToken;
  String? phone;
  String? image;
  String? location;


  Doctor(doctor) {
    id = doctor['id'];
    name = doctor['name'];
    email = doctor['email'];
    apiToken = doctor['api_token'] ?? '';
    phone = doctor['phone'];
    image = doctor['profilepic'];
    location = doctor['location'];
  }
}
