import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_in_form/screens/sign_in_page.dart';
import 'package:sign_in_form/widgets/button.dart';
import 'package:sign_in_form/widgets/phone_number_input_field.dart';

void main() {
  testWidgets('SignInPage UI elements are rendered correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => const MaterialApp(
          home: SignInPage(),
        ),
      ),
    );

    // Verify that the main UI elements are present
    expect(find.text('Enter your phone'), findsOneWidget);
    expect(find.text('You will receive a 4 digit code to verify your account'),
        findsOneWidget);
    expect(find.byType(PhoneTextInputForm), findsOneWidget);
    expect(find.byType(AppButton), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
    expect(find.text('Or continue with'), findsOneWidget);
  });

  testWidgets('Continue button is initially disabled',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => const MaterialApp(
          home: SignInPage(),
        ),
      ),
    );

    // Find the AppButton
    final AppButton continueButton =
        tester.widget(find.byType(AppButton)) as AppButton;

    // Verify that the button is initially disabled
    expect(continueButton.allowSubmit, false);
  });

  testWidgets('Social login buttons are present', (WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => const MaterialApp(
          home: SignInPage(),
        ),
      ),
    );

    // Verify that all social login buttons are present
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Apple'), findsOneWidget);
    expect(find.text('Google'), findsOneWidget);
    expect(find.text('Facebook'), findsOneWidget);
  });

  testWidgets('Sign up link is present', (WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => const MaterialApp(
          home: SignInPage(),
        ),
      ),
    );

    // Verify that the sign up text is present
    expect(find.text('Not a member? '), findsOneWidget);
    expect(find.text('Sign up'), findsOneWidget);
  });
}
