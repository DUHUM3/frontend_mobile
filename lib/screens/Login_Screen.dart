import 'package:flutter/material.dart';
import 'package:frontend_mobile/screens/Splash_Screen.dart';
import 'package:frontend_mobile/screens/SignUp_Screen.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneFocusNode = FocusNode();
    final passwordFocusNode = FocusNode();
    final codeFocusNode = FocusNode();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF001F3F),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context)
              .unfocus(); 
        },
        child: Builder(
          builder: (context) {
            bool isKeyboardVisible =
                MediaQuery.of(context).viewInsets.bottom > 0;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isKeyboardVisible) 
                  const CircleAvatar(
                    radius: 210,
                    backgroundImage: AssetImage('assets/images/logo.png'),
                    backgroundColor: Colors.transparent,
                  ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        focusNode: phoneFocusNode,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Phone'.tr(),    
                          labelStyle: TextStyle(color: Color(0xFF001F3F)),
                          border: OutlineInputBorder(),
                        ),
                        onSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(passwordFocusNode);
                        },
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        focusNode: passwordFocusNode,
                        obscureText: true,
                        decoration:  InputDecoration(
                          labelText: 'Password'.tr(),
                          labelStyle: TextStyle(color: Color(0xFF001F3F)),
                          border: OutlineInputBorder(),
                        ),
                        onSubmitted: (_) {
                          FocusScope.of(context).requestFocus(codeFocusNode);
                        },
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        focusNode: codeFocusNode,
                        decoration: InputDecoration(
                          labelText: 'Code'.tr(),
                          labelStyle: TextStyle(color: Color(0xFF001F3F)),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                            );
                          },
                          child: Text(
                            'Create new account'.tr(),
                            style: TextStyle(
                              color: Color(0xFF001F3F),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyWidget()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF001F3F),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Text(
                            'Login'.tr(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
