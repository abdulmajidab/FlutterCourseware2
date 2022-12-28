class Register {
  final int? id;
  final String name;
  final String date;
  final String email;

  Register({
     this.id,
    required this.name,
    required this.date,
    required this.email,
  });

  Register.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        name = res["name"],
        date = res["date"],
        email = res["email"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'date': date,
      'name': name,
      'email': email,
    };
  }
}
