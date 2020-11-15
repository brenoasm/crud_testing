class User {
  int id;
  String email;
  String password;

  User.createDefault(
    this.email,
    this.password,
  ) {
    id = 1;
  }
}
