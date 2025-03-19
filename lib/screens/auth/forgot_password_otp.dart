import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_in_form/constants/styles.dart';
import 'package:sign_in_form/screens/settings/settings.dart';
import 'package:sign_in_form/utils/dialog_utils.dart';
import 'package:sign_in_form/widgets/button.dart';
import 'package:sign_in_form/widgets/text_input_field.dart';

class ForgotPasswordOtpPage extends StatefulWidget {
  final String email;
  const ForgotPasswordOtpPage({super.key, required this.email});

  @override
  State<ForgotPasswordOtpPage> createState() => _ForgotPasswordOtpPageState();
}

class _ForgotPasswordOtpPageState extends State<ForgotPasswordOtpPage> {
  final otpTC = TextEditingController();
  bool isCodeComplete = false;

  @override
  void dispose() {
    otpTC.dispose();
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter the confirmation code",
                  style: TextStyles.style24extrabold.copyWith(fontSize: 26.sp),
                ),
                RichText(
                  text: TextSpan(
                    text:
                        "To confirm your account, enter the 6-digit code we sent to ",
                    style: TextStyles.style16regular.copyWith(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: widget.email,
                        style: TextStyles.style16regular.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: '.',
                        style: TextStyles.style16regular.copyWith(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                TextInputForm(
                  label: "Confirmation Code",
                  hint: '******',
                  obscure: true,
                  maxLength: 6,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  onChanged: (val) {
                    setState(() {
                      isCodeComplete = val.isNotEmpty &&
                          val.length == 6 &&
                          val.toString() == "123456" &&
                          !val.contains(' ');
                    });
                  },
                ),
                SizedBox(height: 20.h),
                AppButton2(
                  allowSubmit: isCodeComplete,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsPage(
                          email: widget.email,
                        ),
                      ),
                    );
                    DialogUtils.showLoadingWithSuccess(
                      context: context,
                      successTitle: 'Update successful!',
                      successMessage: "You're logged in",
                      onContinue: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  title: "Next",
                ),
                SizedBox(height: 20.h),
                AppButton2(
                  onTap: () {
                    DialogUtils.showLoading(
                      context: context,
                    );
                  },
                  title: "I didn't get the code",
                  textColor: Colors.black,
                  buttonColor: Colors.transparent,
                  borderColor: Colors.grey.shade400,
                ),
              ],
            ),
          ),
        ));
  }
}
