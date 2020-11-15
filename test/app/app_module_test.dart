import 'package:crud_testing/app/shared/repositories/user_repository/user_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';

import 'init_app_module_helper.dart';
import 'mocks/mock_user_repository.dart';

void main() {
  group('AppModule', () {
    setUp(() {
      InitAppModuleHelper().load();
    });

    test('successfully instantiate MockUserRepository', () {
      expect(Modular.get<IUserRepository>(), isA<MockUserRepository>());
    });
  });
}
