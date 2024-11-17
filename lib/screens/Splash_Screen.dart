import 'package:flutter/material.dart';
import 'package:frontend_mobile/screens/Home_Screen.dart';


class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      body: Center(
        child: FutureBuilder(
          future: Future.delayed(Duration(seconds: 3)), 
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Image.asset('assets/images/logo.png');  
            } else {
              Future.delayed(Duration.zero, () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()), 
                );
              });
              return SizedBox();             }
          },
        ),
      ),
    );
  }
}

