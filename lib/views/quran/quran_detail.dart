import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/constants.dart';
import 'package:islami_app/models/sura_content_model.dart';
import 'package:provider/provider.dart';

import '../../config/settings_provider.dart';

class QuranDetail extends StatefulWidget {
  static const String routeName = 'QuranDetail';

  const QuranDetail({super.key});

  @override
  State<QuranDetail> createState() => _QuranDetailState();
}

class _QuranDetailState extends State<QuranDetail> {
  List<String> versesList = [];

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments as SuraContent;
    Size mediaQuery = MediaQuery.of(context).size;
    var vm = Provider.of<SettingsProvider>(context);
    var theme = Theme.of(context);



    if (versesList.isEmpty) loadData(arguments.suraNumber);
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            vm.getBackGround(),
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'إسلامي',
          ),
        ),
        body: Container(
            width: mediaQuery.width,
            height: mediaQuery.height,
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 15,
              bottom: 80,
            ),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
             color: vm.currentThemeMode == ThemeMode.light ?Colors.white.withOpacity(.8): kPrimaryColorDarkTheme.withOpacity(.8),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'سورة ${arguments.suraName}',
                      style: theme.textTheme.titleLarge
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                     Icon(
                      Icons.play_circle_fill_outlined,
                      size: 28,
                      color: vm.currentThemeMode == ThemeMode.light ?Colors.black: kSecondColorDarkTheme,
                    ),
                  ],
                ),
                 Divider(
                  color: vm.currentThemeMode == ThemeMode.light ?kPrimaryColorLightTheme: kSecondColorDarkTheme,
                ),
                if (versesList.isEmpty)
                  const Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColorLightTheme,
                    ),
                  ),
                if (versesList.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Text(
                          '${{index + 1}} ${versesList[index]}',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodySmall
                        );
                      },
                      itemCount: versesList.length,
                    ),
                  ),
              ],
            )),
      ),
    );
  }

  Future<void> loadData(String suraNumber) async {
    String content =
        await rootBundle.loadString('assets/files/${suraNumber}.txt');
    versesList = content.split('\n');
    setState(() {});
  }
}
