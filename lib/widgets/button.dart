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
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            border: Border.all(
              color: borderColor ?? Colors.black,
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: hPadding ?? 15.0,
            vertical: vPadding ?? 15.0,
          ),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyles.style16regular.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
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
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: vPadding ?? 15.0,
      ),
      child: OutlinedButton.icon(
        onPressed: allowSubmit ? onTap : null,
        icon: icon,
        label: Text(
          title,
          style: TextStyles.style17extrabold,
        ),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: vPadding ?? 16,
            horizontal: hPadding ?? 24,
          ),
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
          ),
        ),
      ),
    );
  }
}
