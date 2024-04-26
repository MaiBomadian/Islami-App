import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLanguage = 'en';
  ThemeMode currentThemeMode = ThemeMode.light;

  Future changeLanguage(String newLanguage) async {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', newLanguage);
  }

  Future<void> getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? language = prefs.getString('language');
    if (language != null) {
      currentLanguage = language;
      notifyListeners();
    }
  }

  Future changeTheme(ThemeMode newThemeMode) async {
    if (currentThemeMode == newThemeMode) return;
    currentThemeMode = newThemeMode;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', newThemeMode == ThemeMode.dark);
  }

  Future<void> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool('isDark');
    if (isDark != null) {
      if (isDark) {
        currentThemeMode = ThemeMode.dark;
      } else {
        currentThemeMode = ThemeMode.light;
      }
      notifyListeners();
    }
  }

  String getBackGround() {
    return currentThemeMode == ThemeMode.light
        ? 'assets/images/main_background.png'
        : 'assets/images/bg.png';
  }
}
