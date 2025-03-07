import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          home: const PhoneAuthScreen(),
        );
      },
    );
  }
}

class PhoneAuthScreen extends StatelessWidget {
  const PhoneAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 60.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter your phone",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "You will receive a 4 digit code to verify your account",
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            SizedBox(height: 20.h),
            IntlPhoneField(
              decoration: InputDecoration(
                labelText: 'Phone number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
              initialCountryCode: 'US',
              onChanged: (phone) {
                debugPrint(phone.completeNumber);
              },
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Continue",
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    ),
                    SizedBox(width: 8.w),
                    const Icon(Icons.arrow_right_alt, color: Colors.white),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: Text(
                "Or continue with",
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
            ),
            SizedBox(height: 16.h),
            _buildSocialButton("Email", Icons.email),
            _buildSocialButton("Apple", Icons.apple),
            _buildSocialButton("Google", Icons.g_mobiledata),
            _buildSocialButton("Facebook", Icons.facebook),
            SizedBox(height: 20.h),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Not a member? ",
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
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

  Widget _buildSocialButton(String label, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: SizedBox(
        width: double.infinity,
        height: 50.h,
        child: OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          onPressed: () {},
          icon: Icon(icon, color: Colors.black),
          label: Text(
            label,
            style: TextStyle(fontSize: 16.sp, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
