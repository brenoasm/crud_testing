import 'package:crud_testing/app/shared/repositories/user_repository/user_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:crud_testing/app/shared/repositories/user_repository/user_repository.dart';

import '../../init_app_module_helper.dart';

class MockClient extends Mock implements Dio {}

void main() {
  group('UserRepository', () {
    MockClient client;
    UserRepository userRepository;

    final typedEmail = 'test@test.com';
    final typedPassword = '123456';

    setUp(() {
      client = MockClient();

      InitAppModuleHelper().load(changeBinds: [
        Bind(
          (i) => UserRepository(
            client,
          ),
        )
      ]);

      userRepository = Modular.get<IUserRepository>();
    });

    test("successfully instantiated", () {
      expect(userRepository, isInstanceOf<UserRepository>());
    });

    test('given an email and a password then returns a user if successfully',
        () async {
      when(
        client.post('https://google.com', data: {
          'email': typedEmail,
          'password': typedPassword,
        }),
      ).thenAnswer(
        (_) async => Response(data: {}, statusCode: 200),
      );

      final user = await userRepository.createUser(typedEmail, typedPassword);

      expect(user.id, 1);
      expect(user.email, typedEmail);
      expect(user.password, typedPassword);
    });

    test('given an email and an empty password then returns null', () async {
      when(
        client.post('https://google.com', data: {
          'email': typedEmail,
          'password': '',
        }),
      ).thenAnswer(
        (_) async => Response(data: {}, statusCode: 400),
      );

      final user = await userRepository.createUser(typedEmail, '');

      expect(user, isNull);
    });

    test('given an empty email and an password then returns null', () async {
      when(
        client.post('https://google.com', data: {
          'email': '',
          'password': typedPassword,
        }),
      ).thenAnswer(
        (_) async => Response(data: {}, statusCode: 400),
      );

      final user = await userRepository.createUser('', typedPassword);

      expect(user, isNull);
    });
  });
}
