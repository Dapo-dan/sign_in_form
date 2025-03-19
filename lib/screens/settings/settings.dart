import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_in_form/constants/const.dart';
import 'package:sign_in_form/constants/styles.dart';
import 'package:sign_in_form/screens/settings/widgets/settings_section_title.dart';
import 'package:sign_in_form/screens/settings/widgets/settings_tile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

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
      // appBar: AppBar(
      //   title: const Text('Settings'),
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   foregroundColor: Colors.black,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Settings",
                style: TextStyles.style24extrabold.copyWith(fontSize: 26.sp),
              ),
              Text(
                "Lorem ipsum dolor sit amet consectetur.",
                style: TextStyles.style16regular
                    .copyWith(color: Colors.grey, fontWeight: FontWeight.w500),
              ),
              verticalSpaceMedium(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                width: double.infinity,
                color: Colors.white,
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "john.doe@mail.com",
                      style: TextStyle(color: Colors.grey),
                    ),
                    verticalSpaceSmall(),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                      label: const Text("Edit Profile"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Preferences
              settingsSectionTitle("PREFERENCES"),
              settingsTile(
                icon: Icons.language,
                iconColor: Colors.orange,
                title: "Language",
                trailing: const Text("English"),
              ),
              SwitchListTile(
                secondary: Icon(Icons.dark_mode, color: Colors.blue),
                title: const Text("Dark Mode"),
                value: darkMode,
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
                trailing: const Text("Los Angeles, CA"),
              ),

              const SizedBox(height: 20),

              // Notifications
              settingsSectionTitle("NOTIFICATIONS"),
              SwitchListTile(
                secondary: Icon(Icons.email, color: Colors.green),
                title: const Text("Email Notifications"),
                value: emailNotifications,
                onChanged: (value) {
                  setState(() {
                    emailNotifications = value;
                  });
                },
              ),
              SwitchListTile(
                secondary: Icon(Icons.notifications, color: Colors.green),
                title: const Text("Push Notifications"),
                value: pushNotifications,
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
                trailing: const Text("Default"),
              ),

              const SizedBox(height: 30),
              const Text(
                "Made with ❤️ in Lagos",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
