import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageSettingsState createState() => _LanguageSettingsState();
}

class _LanguageSettingsState extends State<LanguageScreen> {
  String _selectedLanguage = 'Arabic';  // اللغة الافتراضية

  @override
  void initState() {
    super.initState();
    _loadLanguage(); 
  }

  // تحميل اللغة من SharedPreferences
  void _loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLanguage = prefs.getString('language') ?? 'en';  // إذا لم تكن هناك قيمة مخزنة، نستخدم الإنجليزية
    setState(() {
      _selectedLanguage = savedLanguage == 'ar' ? 'Arabic' : 'English';
      context.setLocale(savedLanguage == 'ar' ? Locale('ar') : Locale('en'));
    });
  }

  // حفظ اللغة في SharedPreferences
  void _saveLanguage(String language, Locale locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', language == 'Arabic' ? 'ar' : 'en');
    context.setLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A1930), 
      appBar: AppBar(
        title: Text('Settings'.tr(), style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF0A1930), 
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          SizedBox(height: 30),
          _buildLanguageOption(
            'Arabic',
            'assets/images/Yemen.png',
            Locale('ar'), 
          ),
          _buildLanguageOption(
            'English',
            'assets/images/english.png', 
            Locale('en'), 
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(String language, String flagPath, Locale locale) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedLanguage = language;
        });
        _saveLanguage(language, locale);

        // تأخير إعادة التشغيل قليلاً لكي تتم عملية تغيير اللغة بشكل صحيح
        Future.delayed(Duration(milliseconds:0), () {
          Restart.restartApp(); 
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Color(0xFF102544),
          border: Border(
            bottom: BorderSide(color: Colors.white54),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: EdgeInsets.symmetric(vertical: 5), 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  flagPath,
                  width: 30,
                  height: 20,
                ),
                SizedBox(width: 10),
                Text(
                  language,
                  style: TextStyle(fontSize: 18, color: Colors.white), // لون النص
                ),
              ],
            ),
            if (_selectedLanguage == language) // إذا كانت اللغة هي التي تم اختيارها
              Icon(
                Icons.check,
                color: Colors.green,
              ),
          ],
        ),
      ),
    );
  }
}
