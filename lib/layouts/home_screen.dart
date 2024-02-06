import 'package:flutter/material.dart';
import 'package:islami_app/views/hadeth/hadeth_screen.dart';
import 'package:islami_app/views/quran/quran_screen_view.dart';
import 'package:islami_app/views/radio/radio_screen.dart';
import 'package:islami_app/views/settings/settings_screen.dart';
import 'package:islami_app/views/tasbeh/tasbeh_screen.dart';

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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/main_background.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إسلامي'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Quran',
              icon: ImageIcon(
                AssetImage('assets/images/quran.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Hadeth',
              icon: ImageIcon(
                AssetImage('assets/images/hadeth.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Tasbeh',
              icon: ImageIcon(
                AssetImage('assets/images/sebha.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Radio',
              icon: ImageIcon(
                AssetImage('assets/images/radio.png'),
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
          ],
        ),
        body: screens[currentIndex],
      ),
    );
  }
}
