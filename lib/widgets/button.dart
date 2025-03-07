import 'package:flutter/material.dart';

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
            color: buttonColor ??
                (allowSubmit
                    ? primaryColor
                    : primaryColor.withValues(
                        alpha: 0.7,
                      )),
            borderRadius: BorderRadius.circular(borderRadius ?? 24),
            border: Border.all(
              color: borderColor ??
                  (allowSubmit
                      ? primaryColor
                      : primaryColor.withValues(
                          alpha: 0.1,
                        )),
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: hPadding ?? 15.0,
            vertical: vPadding ?? 13.0,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyles.style16regular.copyWith(
                color: textColor ?? white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
