import 'package:flutter/material.dart';
import 'package:last_graduation/Theme/theme.dart';
import 'package:last_graduation/splash_screen/splash.dart';
import 'home_screen/homescreen.dart';
import 'login_screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routName,
        routes: {
          SplashScreen.routName: (context) => const SplashScreen(),
          HomeScreen.routName: (context) => const HomeScreen(),
          Login.routName: (context) => Login(),
        });

  }
}
