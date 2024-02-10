import 'package:flutter/material.dart';
import 'package:islami_app/constants.dart';
import 'package:islami_app/models/hadeth_content_model.dart';
import 'package:provider/provider.dart';

import '../../config/settings_provider.dart';

class HadethDetail extends StatelessWidget {
  const HadethDetail({super.key});

  static const String routeName = 'hadethDetail';

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments as HadethModel;
    Size mediaQuery = MediaQuery.of(context).size;
    var vm = Provider.of<SettingsProvider>(context);
    var theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(vm.getBackGround()),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إسلامي'),
        ),
        body: Container(
          height: mediaQuery.height,
          width: mediaQuery.width,
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 15,
            bottom: 80,
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            color: vm.currentThemeMode == ThemeMode.light
                ? Colors.white.withOpacity(.8)
                : kPrimaryColorDarkTheme.withOpacity(.8),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Text(arguments.title, style: theme.textTheme.bodyLarge),
              Divider(
                color: vm.currentThemeMode == ThemeMode.light
                    ? kPrimaryColorLightTheme
                    : kSecondColorDarkTheme,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(arguments.hadethContent,
                      textAlign: TextAlign.right,
                      style: theme.textTheme.bodySmall),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
