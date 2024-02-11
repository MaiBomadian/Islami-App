import 'package:flutter/material.dart';
import 'package:islami_app/constants.dart';

class ApplicationTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 30,
        fontFamily: 'El Messiri',
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'El Messiri',
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontSize: 30,
      ),
      titleMedium: TextStyle(
        fontFamily: 'El Messiri',
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontSize: 25,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'El Messiri',
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontSize: 25,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'El Messiri',
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontSize: 25,
      ),
      bodySmall: TextStyle(
        fontFamily: 'El Messiri',
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontSize: 20,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kPrimaryColorLightTheme,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(
          fontSize: 17,
          fontFamily: 'El Messiri',
          fontWeight: FontWeight.normal,
          color: Colors.black),
      selectedIconTheme: IconThemeData(
        color: Colors.black,
      ),
      unselectedItemColor: Colors.white,
      unselectedLabelStyle: TextStyle(
        fontSize: 12,
        fontFamily: 'El Messiri',
        fontWeight: FontWeight.normal,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: kSecondColorDarkTheme),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 30,
        fontFamily: 'El Messiri',
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'El Messiri',
        fontWeight: FontWeight.w500,
        color: kSecondColorDarkTheme,
        fontSize: 30,
      ),
      titleMedium: TextStyle(
        fontFamily: 'El Messiri',
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontSize: 25,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'El Messiri',
        fontWeight: FontWeight.w500,
        color: kSecondColorDarkTheme,
        fontSize: 25,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'El Messiri',
        fontWeight: FontWeight.normal,
        color: Colors.white,
        fontSize: 25,
      ),
      bodySmall: TextStyle(
        fontFamily: 'El Messiri',
        fontWeight: FontWeight.normal,
        color: kSecondColorDarkTheme,
        fontSize: 20,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kPrimaryColorDarkTheme,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: kSecondColorDarkTheme,
      selectedLabelStyle: TextStyle(
          fontSize: 17,
          fontFamily: 'El Messiri',
          fontWeight: FontWeight.normal,
          color: Colors.black),
      selectedIconTheme: IconThemeData(
        color: kSecondColorDarkTheme,
      ),
      unselectedItemColor: Colors.white,
      unselectedLabelStyle: TextStyle(
        fontSize: 12,
        fontFamily: 'El Messiri',
        fontWeight: FontWeight.normal,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
  );
}
