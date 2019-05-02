// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:keeper/main.dart';
import 'package:keeper/src/resources/repository/UserRepository.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App(userRepository: UserRepositoryTest()));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

class UserRepositoryTest extends UserRepository {
  @override
  Future<String> authenticate({String username, String password}) {
    // TODO: implement authenticate
    return null;
  }

  @override
  Future<void> deleteToken() {
    // TODO: implement deleteToken
    return null;
  }

  @override
  Future<bool> hasToken() {
    // TODO: implement hasToken
    return null;
  }

  @override
  Future<void> persistToken(String token) {
    // TODO: implement persistToken
    return null;
  }

  @override
  Future<String> registerNewCompany(
      {String companyName,
      String companyEmail,
      String password,
      String location}) {
    // TODO: implement registerNewCompany
    return null;
  }
}
