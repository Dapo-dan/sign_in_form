import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_in_form/constants/const.dart';
import 'package:sign_in_form/constants/styles.dart';

Widget settingsSectionTitle(String title) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade300),
    ),
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpaceSmall(),
        Text(
          title,
          style: TextStyles.style17extrabold.copyWith(color: Colors.grey),
        ),
      ],
    ),
  );
}
