import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData tema = ThemeData(
    // fontFamily: 'PtSansNarrow',

    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary:  Color.fromRGBO(255, 148, 0, 1), // #FF9400
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.black,
      tertiary:  Color.fromRGBO(255, 152, 12, 1), // #FF980C
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
