import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sign_in_form/screens/auth/sign_in_page.dart';
import 'package:sign_in_form/widgets/phone_number_input_field.dart';

void main() {
  Widget makeTestableWidget(Widget child) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Ensures proper scaling
      builder: (context, widget) => MaterialApp(home: child),
    );
  }

  testWidgets('Valid phone number enables Continue button',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(const SignInPage()));

    final Finder phoneField = find.byType(PhoneTextInputForm);
    final Finder continueButton = find.text("Continue");

    await tester.enterText(phoneField, "+1234567890");
    await tester.pumpAndSettle(); // Allow UI updates

    await tester.tap(continueButton);
    await tester.pumpAndSettle(); // Ensures dialog appears

    // Check for the success message instead of SuccessDialog widget
    expect(find.text("Successful submission!"), findsOneWidget);
  });

  testWidgets('Invalid phone number shows validation error',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(const SignInPage()));

    final Finder phoneField = find.byType(PhoneTextInputForm);
    await tester.enterText(phoneField, "123"); // Invalid number
    await tester.pumpAndSettle(); // Wait for UI update

    // Force validation manually
    final formKeyFinder = find.byType(Form);
    final formState = tester.state<FormState>(formKeyFinder);
    formState.validate();

    await tester.pumpAndSettle(); // Ensure validation messages show

    expect(find.text("Please enter a valid phone number"), findsOneWidget);
  });

  testWidgets('Tapping Continue triggers SuccessDialog',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(const SignInPage()));

    final Finder phoneField = find.byType(PhoneTextInputForm);
    await tester.enterText(phoneField, "+1234567890");
    await tester.pumpAndSettle();

    await tester.tap(find.text("Continue"));
    await tester.pumpAndSettle(); // Wait for dialog

    expect(find.text("Successful submission!"), findsOneWidget);
  });
}
