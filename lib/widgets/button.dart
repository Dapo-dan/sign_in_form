import 'package:flutter/material.dart';
import 'package:sign_in_form/constants/styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onTap,
    required this.title,
    this.buttonColor,
    this.borderColor,
    this.textColor,
    this.borderRadius,
    this.hPadding,
    this.vPadding,
    this.allowSubmit = true,
  });

  final String title;
  final void Function() onTap;
  final Color? buttonColor, borderColor;
  final Color? textColor;
  final double? borderRadius, hPadding, vPadding;
  final bool allowSubmit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: allowSubmit ? onTap : null,
      child: Container(
        decoration: BoxDecoration(
            color: buttonColor ?? Colors.black,
            borderRadius: BorderRadius.circular(borderRadius ?? 24),
            border: Border.all(
              color: borderColor ?? Colors.black,
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: hPadding ?? 15.0,
            vertical: vPadding ?? 13.0,
          ),
          child: Center(
              child: Row(
            children: [
              Text(
                title,
                style: TextStyles.style16regular.copyWith(
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              )
            ],
          )),
        ),
      ),
    );
  }
}

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
    this.borderRadius,
    this.hPadding,
    this.vPadding,
    this.allowSubmit = true,
  });

  final String title;
  final void Function() onTap;
  final Widget icon;
  final double? borderRadius, hPadding, vPadding;
  final bool allowSubmit;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: allowSubmit ? onTap : null,
      icon: icon,
      label: Text(
        title,
        style: TextStyles.style16regular,
      ),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: vPadding ?? 16,
          horizontal: hPadding ?? 24,
        ),
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
        ),
      ),
    );
  }
}

      //  OutlinedButton.icon(
      //             onPressed: () {
      //               controller.signInWithApple(isSignup: true);
      //             },
      //             icon: SvgPicture.asset(
      //               IconPath.apple,
      //             ),
      //             label: Text(
      //               'Sign up with Apple',
      //               style: TextStyles.style16,
      //             ),
      //             style: OutlinedButton.styleFrom(
      //               padding: const EdgeInsets.symmetric(
      //                 vertical: 16,
      //                 horizontal: 24,
      //               ),
      //               minimumSize: const Size(double.infinity, 48),
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(12),
      //               ),
      //             ),
      //           ),