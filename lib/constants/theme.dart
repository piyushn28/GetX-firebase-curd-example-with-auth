import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    primaryColor: Colors.green,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.green,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green))),
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.red),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.red,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red))),
  );
}