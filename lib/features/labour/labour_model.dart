class Labour {
  String id;
  String name;
  String phone;
  String skill;
  int experience;
  String location;

  Labour({
    required this.id,
    required this.name,
    required this.phone,
    required this.skill,
    required this.experience,
    required this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'skill': skill,
      'experience': experience,
      'location': location,
    };
  }
}