import 'package:flutter/material.dart';
import 'package:islami_app/config/settings_provider.dart';
import 'package:islami_app/constants.dart';
import 'package:provider/provider.dart';

class QuranListTitle extends StatelessWidget {
  final String suraName;
  final String suraNumber;

  const QuranListTitle({
    super.key,
    required this.suraName,
    required this.suraNumber,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var vm = Provider.of<SettingsProvider>(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            suraNumber,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
        ),
        Container(
          height: 45,
          width: 2,
          color: vm.currentThemeMode == ThemeMode.light
              ? kPrimaryColorLightTheme
              : kSecondColorDarkTheme,
        ),
        Expanded(
          child: Text(
            suraName,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
