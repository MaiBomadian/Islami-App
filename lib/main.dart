import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/config/application_theme_manager.dart';
import 'package:islami_app/config/settings_provider.dart';
import 'package:islami_app/layouts/home_screen.dart';
import 'package:islami_app/views/hadeth/hadeth_detail.dart';
import 'package:islami_app/views/quran/quran_detail.dart';
import 'package:islami_app/views/splash/screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => SettingsProvider()
      ..getLanguage()
      ..getTheme(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(vm.currentLanguage),
      theme: ApplicationTheme.lightTheme,
      darkTheme: ApplicationTheme.darkTheme,
      themeMode: vm.currentThemeMode,
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
