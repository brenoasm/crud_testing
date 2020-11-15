import 'package:crud_testing/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'mocks/mock_user_repository.dart';

class InitAppModuleHelper extends IModularTest {
  final ModularTestType modularTestType;

  InitAppModuleHelper({
    this.modularTestType,
  }) : super(modularTestType: ModularTestType.resetModules);

  @override
  List<Bind> get binds => [
        Bind(
          (i) => MockUserRepository(),
        ),
      ];

  @override
  ChildModule get module => AppModule();

  @override
  IModularTest get modulardependency => null;
}
