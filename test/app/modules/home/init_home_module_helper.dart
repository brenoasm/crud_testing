import 'package:crud_testing/app/modules/home/home_controller.dart';
import 'package:crud_testing/app/modules/home/home_module.dart';
import 'package:crud_testing/app/shared/repositories/user_repository/user_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import '../../init_app_module_helper.dart';

class InitHomeModuleHelper extends IModularTest {
  @override
  List<Bind> get binds => [];

  @override
  ChildModule get module => HomeModule();

  @override
  IModularTest get modulardependency => InitAppModuleHelper();
}
