import 'package:flutter/material.dart';
// import 'package:frontend_mobile/main.dart';
import 'package:frontend_mobile/screens/Language_Screen.dart';
import 'package:easy_localization/easy_localization.dart';


class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A1930), 
      appBar: AppBar(
        backgroundColor: Color(0xFF0A1930),
        elevation: 0,
        title: Text('Home', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account settings',
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            buildSettingsItem(
              icon: Icons.person_outline,
              color: Colors.blue,
              title: 'Profile Information'.tr(),
              // subtitle: 'Name, Email, Security',
              onTap: () {
                print("Profile Information clicked");
              },
            ),
            buildSettingsItem(
              icon: Icons.lock_outline,
              color: Colors.green,
              title: 'Change Password'.tr(),
              // subtitle: 'Change your current password',
              onTap: () {
                print("Change Password clicked");
              },
            ),
            buildSettingsItem(
              icon: Icons.notifications_outlined,
              color: Colors.red,
              title: 'Push Notifications'.tr(),
              onTap: () {
                print("Push Notifications clicked");
              },
            ),
            buildSettingsItem(
              icon: Icons.language,
              color: Colors.purple,
              title: 'Language'.tr(),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LanguageScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingsItem({
    required IconData icon,
    required Color color,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      padding: EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        color: Color(0xFF102544),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle,
                style: TextStyle(color: Colors.white70),
              )
            : null,
        onTap: onTap, 
      ),
    );
  }
}
