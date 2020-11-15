import 'package:crud_testing/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';

import 'init_home_module_helper.dart';

main() {
  group('HomeModule', () {
    setUp(() {
      InitHomeModuleHelper().load();
    });

    test('has a HomeController', () {
      expect(Modular.get<HomeController>(), isA<HomeController>());
    });
  });
}
