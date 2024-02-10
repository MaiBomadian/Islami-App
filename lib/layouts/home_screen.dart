import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/config/settings_provider.dart';
import 'package:islami_app/views/hadeth/hadeth_screen.dart';
import 'package:islami_app/views/quran/quran_screen_view.dart';
import 'package:islami_app/views/radio/radio_screen.dart';
import 'package:islami_app/views/settings/settings_screen.dart';
import 'package:islami_app/views/tasbeh/tasbeh_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    QuranScreen(),
    HadethScreen(),
    TasbehScreen(),
    RadioScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context)!;
    var vm = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            vm.getBackGround(),
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(language.islami),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              label: language.quran,
              icon: const ImageIcon(
                AssetImage('assets/images/quran.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: language.hadeth,
              icon: const ImageIcon(
                AssetImage('assets/images/hadeth.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: language.tasbeh,
              icon: const ImageIcon(
                AssetImage('assets/images/sebha.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: language.radio,
              icon: const ImageIcon(
                AssetImage('assets/images/radio.png'),
              ),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: language.settings,
            ),
          ],
        ),
        body: screens[currentIndex],
      ),
    );
  }
}
