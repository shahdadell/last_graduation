import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        color: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    )
  );
}
