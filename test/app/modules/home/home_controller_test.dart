import 'package:crud_testing/app/shared/models/user.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:crud_testing/app/modules/home/home_controller.dart';

import 'init_home_module_helper.dart';

void main() {
  group('HomeController', () {
    HomeController homeController;

    final typedEmail = 'testing@test.com';
    final typedPassword = '123456';

    setUp(() {
      InitHomeModuleHelper().load();

      homeController = Modular.get<HomeController>();
    });

    test("successfully instantiated", () {
      expect(homeController, isInstanceOf<HomeController>());
    });

    test('successfully change the email', () {
      expect(homeController.email, isEmpty);

      homeController.onEmailChanged(typedEmail);

      expect(homeController.email, typedEmail);
    });

    test('successfully change the password', () {
      expect(homeController.password, isEmpty);

      homeController.onPasswordChanged(typedPassword);

      expect(homeController.password, typedPassword);
    });

    test('successfully enable the submit', () {
      expect(homeController.email, isEmpty);
      expect(homeController.password, isEmpty);
      expect(homeController.isSubmitEnabled, false);

      homeController.onEmailChanged(typedEmail);
      homeController.onPasswordChanged(typedPassword);

      expect(homeController.isSubmitEnabled, true);
    });

    test('throws a exception when submiting if there is no e-mail', () {
      homeController.onPasswordChanged(typedPassword);

      expect(homeController.onSubmit, throwsException);
    });

    test('throws a exception when submiting if there is no password', () {
      homeController.onEmailChanged(typedEmail);

      expect(homeController.onSubmit, throwsException);
    });

    test('when submitted, set user correctly', () async {
      when(
        homeController.userRepository.createUser(typedEmail, typedPassword),
      ).thenAnswer(
        (_) => Future.value(
          User.createDefault(typedEmail, typedPassword),
        ),
      );

      homeController.onEmailChanged(typedEmail);
      homeController.onPasswordChanged(typedPassword);

      await homeController.onSubmit();

      expect(homeController.user.id, 1);
      expect(homeController.user.email, typedEmail);
      expect(homeController.user.password, typedPassword);
    });

    test('when submitted and an error occurs, user is null', () async {
      when(homeController.userRepository.createUser(typedEmail, typedPassword))
          .thenThrow(
        Exception('exception'),
      );

      homeController.onEmailChanged(typedEmail);
      homeController.onPasswordChanged(typedPassword);

      await homeController.onSubmit();

      expect(homeController.user, isNull);
    });
  });
}
