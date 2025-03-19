import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_in_form/constants/const.dart';
import 'package:sign_in_form/constants/styles.dart';
import 'package:sign_in_form/screens/auth/forgot_password_otp.dart';
import 'package:sign_in_form/widgets/button.dart';
import 'package:sign_in_form/widgets/text_input_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailTC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isEmailValid = false;

  @override
  void dispose() {
    emailTC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFe8edf5),
        appBar: AppBar(
          backgroundColor: Color(0xFFe8edf5),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Forgot password?",
                    style:
                        TextStyles.style24extrabold.copyWith(fontSize: 26.sp),
                  ),
                  Text(
                    "Enter the email associated with your account",
                    style: TextStyles.style16regular.copyWith(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20.h),
                  TextInputForm(
                    label: "Email Address",
                    hint: 'john@example.com',
                    controller: emailTC,
                    onChanged: (val) {
                      setState(() {
                        isEmailValid = val.isNotEmpty &&
                            RegExp(emailRegex).hasMatch(val) &&
                            !val.contains(' ');
                      });
                    },
                    validator: (val) {
                      if (val.isEmpty) {
                        return emptyEmailField;
                      }
                      // Regex for email validation
                      final regExp = RegExp(emailRegex);
                      if (regExp.hasMatch(val) || val.contains(' ')) {
                        return null;
                      }
                      return invalidEmailField;
                    },
                  ),
                  SizedBox(height: 20.h),
                  AppButton2(
                    allowSubmit: isEmailValid,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ForgotPasswordOtpPage(email: emailTC.text),
                          ),
                        );
                        // DialogUtils.showLoadingWithSuccess(
                        //   context: context,
                        //   successTitle: 'Successful submission!',
                        //   successMessage:
                        //       "You're logged in, navigating to the next screen!",
                        //   onContinue: () {
                        //     Navigator.of(context).pop();
                        //   },
                        // );
                      }
                    },
                    title: "Next",
                  ),
                  SizedBox(height: 400.h),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: TextStyles.style16bold,
                        children: [
                          TextSpan(
                            text: "Sign in",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
