import 'package:crud_testing/app/shared/models/user.dart';
import 'package:crud_testing/app/shared/repositories/user_repository/user_repository_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IUserRepository userRepository;

  _HomeControllerBase({
    @required this.userRepository,
  });

  @computed
  bool get isSubmitEnabled => email.isNotEmpty && password.isNotEmpty;

  @observable
  String email = '';

  @action
  void onEmailChanged(String value) {
    email = value;
  }

  @observable
  String password = '';

  @action
  void onPasswordChanged(String value) {
    password = value;
  }

  @observable
  User user;

  @action
  void onUserChanged(User value) {
    user = value;
  }

  Future<void> onSubmit() async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception('E-mail or password is empty');
    }

    try {
      final user = await userRepository.createUser(email, password);

      onUserChanged(user);
    } catch (e) {}
  }
}
