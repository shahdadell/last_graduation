import 'dart:async';
import 'package:flutter/material.dart';
import 'package:last_graduation/login_screen/login.dart';

class SplashScreen extends StatelessWidget {
  static const String routName = "splash" ;
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 5),
            (){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const Login();
              },
            ),
          );
        });
    var mediaQuery = MediaQuery.of(context).size ;
    return Scaffold(
      body: Image.asset("assets/images/copy.gif",
        width: mediaQuery.width,
        height: mediaQuery.height,
        fit: BoxFit.cover,
      ),
    );
  }
}
