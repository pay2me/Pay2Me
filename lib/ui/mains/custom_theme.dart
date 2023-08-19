import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData tema = ThemeData(
    // fontFamily: 'PtSansNarrow',

    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromRGBO(255, 148, 0, 1),
      onPrimary: Colors.white,
      secondary: Color.fromRGBO(30, 62, 112, 1),
      onSecondary: Colors.white,
      tertiary:  Colors.white,
      shadow:  Color.fromARGB(255, 179, 179, 179),
      error:  Color.fromARGB(174, 255, 0, 0),
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    

    iconTheme: const IconThemeData(
      color: Color.fromRGBO(255, 148, 0, 1),
      size: 35,
    ),
    
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: Color.fromRGBO(30, 62, 112, 1),
        fontSize: 24,
        // fontWeight: FontWeight.bold,
      ),
    ),
  );
}
