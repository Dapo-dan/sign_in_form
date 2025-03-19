import 'package:flutter/material.dart';
import 'package:sign_in_form/constants/styles.dart';

Widget settingsTile({
  required IconData icon,
  required Color iconColor,
  required String title,
  Widget? trailing,
}) {
  return ListTile(
    leading: Icon(icon, color: iconColor),
    title: Text(
      title,
      style: TextStyles.style17extrabold,
    ),
    trailing: trailing,
    tileColor: Colors.white,
  );
}
