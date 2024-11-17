import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:frontend_mobile/screens/Working_Screen.dart';
import 'package:frontend_mobile/screens/Setting_Screen.dart';
import 'package:frontend_mobile/screens/Reports_Screen.dart';
import 'package:frontend_mobile/screens/Financial_Screen.dart';
import 'package:frontend_mobile/screens/Permissions_Screen.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001F3F),
      body: Column(
        children: [
          // Header
          Container(
            color: const Color(0xFF001F3F),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.person, color: Colors.white, size: 50),
                    const SizedBox(height: 8),
                    Text('Username'.tr(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Text('Department'.tr(),
                        style: TextStyle(color: Colors.white70, fontSize: 14)),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SettingsScreen()), // استبدل YourNextScreen باسم الشاشة التي تريد الانتقال إليها
                    );
                  },
                  child: Icon(Icons.settings, color: Colors.white, size: 30),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  MenuButton(
                      icon: Icons.event,
                      label: 'Attendance'.tr(),
                      onTap: () =>
                          _navigateToScreen(context, 'AttendanceScreen')),
                  MenuButton(
                    icon: Icons.calendar_today,
                    label: 'Working Days'.tr(),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WorkingScreen())),
                  ),
                  MenuButton(
                    icon: Icons.insert_chart,
                    label: 'Reports'.tr(),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AttendanceReportPage())),
                  ),
                  MenuButton(
                    icon: Icons.account_balance,
                    label: 'Financial Transactions'.tr(),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InvoiceScreen())),
                  ),
                  MenuButton(
                    icon: Icons.lock,
                    label: 'Permissions'.tr(),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LeaveRequestScreen())),
                  ),
                  MenuButton(
                      icon: Icons.fingerprint,
                      label: 'Add Fingerprint'.tr(),
                      onTap: () =>
                          _navigateToScreen(context, 'AddFingerprintScreen')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToScreen(BuildContext context, String screenName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScreenPlaceholder(screenName: screenName),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const MenuButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // تم إضافة التعامل مع النقر هنا
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4), // تأثير الظل
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: const Color(0xFF001F3F)), // أيقونة أكبر
            const SizedBox(height: 12),
            Text(
              label,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF001F3F)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenPlaceholder extends StatelessWidget {
  final String screenName;

  const ScreenPlaceholder({super.key, required this.screenName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(screenName)),
      body: Center(
        child: Text('Welcome to $screenName', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
