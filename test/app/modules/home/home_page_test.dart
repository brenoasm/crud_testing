import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:crud_testing/app/modules/home/home_page.dart';

import 'init_home_module_helper.dart';

void main() {
  group('HomePage', () {
    Future<void> _pumpHomePage(tester) {
      return tester.pumpWidget(
        buildTestableWidget(
          HomePage(),
        ),
      );
    }

    setUp(() {
      InitHomeModuleHelper().load();
    });

    testWidgets('has a welcome message', (tester) async {
      await _pumpHomePage(tester);

      final welcomeText = find.text('Welcome to our app');

      expect(welcomeText, findsOneWidget);
    });

    testWidgets('has all the form requirements', (tester) async {
      await _pumpHomePage(tester);

      final emailTextField = find.text('E-mail');
      final passwordTextField = find.text('Password');
      final submitButton = find.byType(RaisedButton);

      expect(emailTextField, findsOneWidget);
      expect(passwordTextField, findsOneWidget);
      expect(submitButton, findsOneWidget);
    });

    testWidgets('has submit disabled', (tester) async {
      await _pumpHomePage(tester);

      final submitButton =
          tester.widget<RaisedButton>(find.byType(RaisedButton));

      expect(submitButton.enabled, isFalse);
    });

    testWidgets('has submit enabled', (tester) async {
      await _pumpHomePage(tester);

      final emailTextField = find.widgetWithText(TextField, 'E-mail');
      final passwordTextField = find.widgetWithText(TextField, 'Password');

      await tester.enterText(emailTextField, 'breno@test.com');
      await tester.enterText(passwordTextField, '123456');

      await tester.pump();

      final submitButton =
          tester.widget<RaisedButton>(find.byType(RaisedButton));

      expect(submitButton.enabled, isTrue);
    });
  });
}
