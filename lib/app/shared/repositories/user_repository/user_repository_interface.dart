import 'package:crud_testing/app/shared/models/user.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class IUserRepository extends Disposable {
  Future<User> createUser(String email, String password);
}
