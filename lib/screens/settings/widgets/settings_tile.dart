  import 'package:flutter/material.dart';

Widget settingsTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    Widget? trailing,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title),
      trailing: trailing,
    );
  }