class User {
  final String username;
  final String password;

  User(this.username, this.password);
}

class Information {
  final int id;
  final String username;
  final String name;
  final String birth;
  final int gender;

  Information(
      {required this.id,
      required this.username,
      required this.name,
      required this.birth,
      required this.gender});
}
