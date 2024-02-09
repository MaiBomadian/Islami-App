import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 45),
      child: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(
            language.language,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomDropdown<String>(
            items: languages,
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            language.theme,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomDropdown<String>(
            items: themeLits,
            onChanged: (value) {},
          )
        ]),
      ),
    );
  }
}
