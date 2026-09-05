import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:assignment_4/main.dart';

void main() {
  testWidgets('HomeScreen renders with navigation cards and navigates to screens', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Verify HomeScreen elements
    expect(find.text('Flutter Concepts'), findsOneWidget);
    expect(find.text('User Input & Forms'), findsOneWidget);
    expect(find.text('Images, Assets & Fonts'), findsOneWidget);
    expect(find.text('Animations'), findsOneWidget);

    // Test Navigation to FormScreen
    await tester.tap(find.text('User Input & Forms'));
    await tester.pumpAndSettle();
    expect(find.text('Submit Form'), findsOneWidget);

    // Navigate back
    await tester.pageBack();
    await tester.pumpAndSettle();

    // Test Navigation to AnimationScreen
    await tester.tap(find.text('Animations'));
    await tester.pumpAndSettle();
    expect(find.text('AnimatedContainer'), findsOneWidget);
    expect(find.text('Animate'), findsOneWidget);

    // Tap Animate button
    await tester.tap(find.text('Animate'));
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();
    expect(find.text('Reset Animation'), findsOneWidget);
  });

  testWidgets('FormScreen validates inputs correctly', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Navigate to FormScreen
    await tester.tap(find.text('User Input & Forms'));
    await tester.pumpAndSettle();

    // Tap submit on empty fields
    await tester.tap(find.text('Submit Form'));
    await tester.pumpAndSettle();

    // Expect validation errors
    expect(find.text('Please enter your name'), findsOneWidget);
    expect(find.text('Please enter your email'), findsOneWidget);
    expect(find.text('Please enter your age'), findsOneWidget);

    // Fill invalid data
    await tester.enterText(find.byType(TextFormField).at(0), 'Al');
    await tester.enterText(find.byType(TextFormField).at(1), 'notanemail');
    await tester.enterText(find.byType(TextFormField).at(2), '250');
    await tester.tap(find.text('Submit Form'));
    await tester.pumpAndSettle();

    expect(find.text('Name must contain at least 3 characters'), findsOneWidget);
    expect(find.text('Please enter a valid email address'), findsOneWidget);
    expect(find.text('Age must be between 1 and 100'), findsOneWidget);

    // Fill valid data
    await tester.enterText(find.byType(TextFormField).at(0), 'Riddhi Zunjarrao');
    await tester.enterText(find.byType(TextFormField).at(1), 'riddhi@example.com');
    await tester.enterText(find.byType(TextFormField).at(2), '21');
    await tester.tap(find.text('Submit Form'));
    await tester.pumpAndSettle();

    // Expect success SnackBar & submitted card
    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Submitted Information'), findsOneWidget);
  });
}
