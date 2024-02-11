import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/constants.dart';
import 'package:provider/provider.dart';

import '../../config/settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final List<String> languages = [
    'English',
    'عربي',
  ];
  final List<String> themeLits = [
    'Light',
    'Dark',
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;
    var vm = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 45),
      child: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(
            language.language,
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomDropdown<String>(
            decoration: CustomDropdownDecoration(
                closedSuffixIcon: Icon(
                  Icons.arrow_drop_down,
                  color: vm.currentThemeMode == ThemeMode.light
                      ? Colors.white
                      : kSecondColorDarkTheme,
                ),
                closedFillColor: vm.currentThemeMode == ThemeMode.dark
                    ? kPrimaryColorDarkTheme
                    : Colors.white,
                expandedFillColor: vm.currentThemeMode == ThemeMode.dark
                    ? kPrimaryColorDarkTheme
                    : Colors.white),
            initialItem: vm.currentLanguage == 'en' ? 'English' : 'عربي',
            items: languages,
            onChanged: (value) {
              if (value == 'English') {
                vm.changeLanguage('en');
              } else if (value == 'عربي') {
                vm.changeLanguage('ar');
              }
            },
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            language.theme,
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomDropdown<String>(
            decoration: CustomDropdownDecoration(
                closedSuffixIcon: Icon(
                  Icons.arrow_drop_down,
                  color: vm.currentThemeMode == ThemeMode.light
                      ? Colors.black
                      : kSecondColorDarkTheme,
                ),
                closedFillColor: vm.currentThemeMode == ThemeMode.dark
                    ? kPrimaryColorDarkTheme
                    : Colors.white,
                expandedFillColor: vm.currentThemeMode == ThemeMode.dark
                    ? kPrimaryColorDarkTheme
                    : Colors.white),
            initialItem:
                vm.currentThemeMode == ThemeMode.light ? 'Light' : 'Dark',
            items: themeLits,
            onChanged: (value) {
              if (value == 'Light') {
                vm.changeTheme(ThemeMode.light);
              } else if (value == 'Dark') {
                vm.changeTheme(ThemeMode.dark);
              }
            },
          )
        ]),
      ),
    );
  }
}
