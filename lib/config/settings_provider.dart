import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLanguage = 'en';
  ThemeMode currentThemeMode = ThemeMode.dark;


  changeLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
  }
  changeTheme(ThemeMode newThemeMode) {
    if (currentThemeMode == newThemeMode) return;
    currentThemeMode = newThemeMode;
    notifyListeners();
  }
 String getBackGround(){
   return currentThemeMode == ThemeMode.light ? 'assets/images/main_background.png' : 'assets/images/bg.png';
  }

}
