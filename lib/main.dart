import 'package:flutter/material.dart';
import 'package:islami_app/config/application_theme_manager.dart';
import 'package:islami_app/layouts/home_screen.dart';
import 'package:islami_app/views/hadeth/hadeth_detail.dart';
import 'package:islami_app/views/quran/quran_detail.dart';
import 'package:islami_app/views/splash/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ApplicationTheme.lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'Islami App',
      initialRoute: SpalshScreen.routeName,
      routes: {
        SpalshScreen.routeName: (context) => const SpalshScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        QuranDetail.routeName: (context) => const QuranDetail(),
        HadethDetail.routeName: (context) => const HadethDetail(),
      },
    );
  }
}
