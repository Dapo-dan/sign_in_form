import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_in_form/constants/styles.dart';
import 'package:sign_in_form/widgets/button.dart';
import 'package:sign_in_form/widgets/phone_number_input_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final phoneNumberTC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 60.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Text(
              "Enter your phone",
              style: TextStyles.style24extrabold.copyWith(fontSize: 26.sp),
            ),
            SizedBox(height: 8.h),
            Text(
              "You will receive a 4 digit code to verify your account",
              style: TextStyles.style16regular.copyWith(color: Colors.grey),
            ),
            SizedBox(height: 20.h),
            PhoneTextInputForm(
              hint: "Phone number",
              keyboardType: TextInputType.phone,
              controller: phoneNumberTC,
              onChanged: (phone) {
                phoneNumberTC.text = phone.completeNumber;
              },
            ),
            SizedBox(height: 20.h),
            AppButton(onTap: () {}, title: "Continue"),
            SizedBox(height: 30.h),
            Center(
              child: Text(
                "Or continue with",
                style: TextStyles.style14regular,
              ),
            ),
            SizedBox(height: 16.h),
            AppOutlinedButton(
              onTap: () {},
              title: "Email",
              icon: Icon(
                Icons.email,
                color: Colors.black,
              ),
            ),
            AppOutlinedButton(
              onTap: () {},
              title: "Apple",
              icon: Icon(
                Icons.apple,
                color: Colors.black,
              ),
            ),
            AppOutlinedButton(
              onTap: () {},
              title: "Google",
              icon: Icon(
                Icons.g_mobiledata,
                color: Colors.black,
              ),
            ),
            AppOutlinedButton(
              onTap: () {},
              title: "Facebook",
              icon: Icon(
                Icons.facebook,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Not a member? ",
                  style: TextStyles.style16bold,
                  children: [
                    TextSpan(
                      text: "Sign up",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
