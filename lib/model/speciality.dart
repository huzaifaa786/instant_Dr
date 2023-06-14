class Speciality {
  int? id;
  String? name;

  Speciality(speciality) {
    id = speciality['id'];
    name = speciality['name'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
