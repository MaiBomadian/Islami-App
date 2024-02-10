import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/config/settings_provider.dart';
import 'package:islami_app/constants.dart';
import 'package:islami_app/models/hadeth_content_model.dart';
import 'package:islami_app/views/hadeth/hadeth_detail.dart';
import 'package:provider/provider.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<HadethModel> hadethContentList = [];

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    var vm =Provider.of<SettingsProvider>(context);
    if (hadethContentList.isEmpty) loadData();
    return Column(
      children: [
        Image.asset(
          'assets/images/hadeth_logo.png',
          height: mediaQuery.height * .2,
        ),
         Divider(
          color: vm.currentThemeMode == ThemeMode.light ?kPrimaryColorLightTheme: kSecondColorDarkTheme,
          thickness: 1.2,
        ),
        const Text(
          'الأحاديث',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'El Messiri',
            fontWeight: FontWeight.w600,
          ),
        ),
         Divider(
          color: vm.currentThemeMode == ThemeMode.light ?kPrimaryColorLightTheme: kSecondColorDarkTheme,
          thickness: 1.2,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: hadethContentList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      HadethDetail.routeName,
                      arguments: hadethContentList[index],
                    );
                  },
                  child: Text(
                    hadethContentList[index].title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "El Messiri",
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }

  Future<void> loadData() async {
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethList = content.split('#');
    for (int i = 0; i < ahadethList.length; i++) {
      String singleHadeth = ahadethList[i].trim();
      int titleIndex = singleHadeth.indexOf('\n');
      String title = singleHadeth.substring(0, titleIndex);
      String hadethContent = singleHadeth.substring(titleIndex + 1);

      HadethModel hadethModel = HadethModel(title, hadethContent);
      hadethContentList.add(hadethModel);
      setState(() {});
    }
  }
}
