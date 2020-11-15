import 'package:crud_testing/app/shared/models/user.dart';
import 'package:crud_testing/app/shared/repositories/user_repository/user_repository_interface.dart';
import 'package:dio/dio.dart';

class UserRepository implements IUserRepository {
  final Dio client;

  UserRepository(this.client);

  @override
  Future<User> createUser(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return null;
    }
    // Just a fake post so we can stub
    await client.post('https://google.com', data: {
      'email': email,
      'password': password,
    });

    return User.createDefault(email, password);
  }

  @override
  void dispose() {}
}
