import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_in_form/constants/const.dart';
import 'package:sign_in_form/constants/styles.dart';
import 'package:sign_in_form/screens/settings/widgets/settings_section_title.dart';
import 'package:sign_in_form/screens/settings/widgets/settings_tile.dart';
import 'package:sign_in_form/widgets/button.dart';

class SettingsPage extends StatefulWidget {
  final String email;
  const SettingsPage({super.key, required this.email});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool darkMode = false;
  bool emailNotifications = true;
  bool pushNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf6f6f6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Settings",
                      style:
                          TextStyles.style24extrabold.copyWith(fontSize: 26.sp),
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet consectetur.",
                      style: TextStyles.style16regular.copyWith(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://randomuser.me/api/portraits/men/1.jpg'),
                    ),
                    verticalSpaceSmall(),
                    Text(
                      "John Doe",
                      style: TextStyles.style17extrabold,
                    ),
                    Text(
                      widget.email,
                      style: TextStyles.style17extrabold
                          .copyWith(color: Colors.grey),
                    ),
                    verticalSpaceSmall(),
                    SizedBox(
                      width: 165,
                      child: AppIconButton(
                        onTap: () {},
                        title: "Edit Profile",
                        borderRadius: 20,
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Preferences
              settingsSectionTitle("PREFERENCES"),
              settingsTile(
                icon: Icons.language,
                iconColor: Colors.orange,
                title: "Language",
                trailing: Text(
                  "English",
                  style:
                      TextStyles.style17extrabold.copyWith(color: Colors.grey),
                ),
              ),
              SwitchListTile(
                tileColor: Colors.white,
                secondary: Icon(Icons.dark_mode, color: Colors.blue),
                title: Text(
                  "Dark Mode",
                  style: TextStyles.style17extrabold,
                ),
                value: darkMode,
                activeColor: Colors.white,
                activeTrackColor: Colors.green,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey.shade300,
                onChanged: (value) {
                  setState(() {
                    darkMode = value;
                  });
                },
              ),
              settingsTile(
                icon: Icons.location_on,
                iconColor: Colors.green,
                title: "Location",
                trailing: Text(
                  "Los Angeles, CA",
                  style:
                      TextStyles.style17extrabold.copyWith(color: Colors.grey),
                ),
              ),
              // Notifications
              settingsSectionTitle("NOTIFICATIONS"),
              SwitchListTile(
                tileColor: Colors.white,
                secondary: Icon(Icons.email, color: Colors.green),
                title: Text(
                  "Email Notifications",
                  style: TextStyles.style17extrabold,
                ),
                value: emailNotifications,
                activeColor: Colors.white,
                activeTrackColor: Colors.green,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey.shade300,
                onChanged: (value) {
                  setState(() {
                    emailNotifications = value;
                  });
                },
              ),
              SwitchListTile(
                tileColor: Colors.white,
                secondary: Icon(Icons.notifications, color: Colors.green),
                title: Text(
                  "Push Notifications",
                  style: TextStyles.style17extrabold,
                ),
                value: pushNotifications,
                activeColor: Colors.white,
                activeTrackColor: Colors.green,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey.shade300,
                onChanged: (value) {
                  setState(() {
                    pushNotifications = value;
                  });
                },
              ),
              settingsTile(
                icon: Icons.music_note,
                iconColor: Colors.red,
                title: "Sound",
                trailing: Text(
                  "Default",
                  style:
                      TextStyles.style17extrabold.copyWith(color: Colors.grey),
                ),
              ),

              verticalSpaceMedium(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Made with ❤️ in Lagos",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              verticalSpaceMedium(),
            ],
          ),
        ),
      ),
    );
  }
}
