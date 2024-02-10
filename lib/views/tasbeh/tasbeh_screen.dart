import 'package:flutter/material.dart';
import 'package:islami_app/constants.dart';
import 'package:provider/provider.dart';

import '../../config/settings_provider.dart';

class TasbehScreen extends StatefulWidget {
  const TasbehScreen({super.key});

  @override
  State<TasbehScreen> createState() => _TasbehScreenState();
}

class _TasbehScreenState extends State<TasbehScreen> {
  List<String> azkarList = [
    'سبحان الله',
    'الحمدلله',
    'لا اله الا الله',
    'الله اكبر',
  ];
  double _rotationAngle = 0.0;
  String text = 'سبحان الله';
  int counter = 0;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);

    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 78,
                ),
                child: GestureDetector(
                  onTap: onMasbahaClicked,
                  child: Transform.rotate(
                    angle: _rotationAngle * (3.1415926535 / 180),
                    child: Image.asset(
                      vm.currentThemeMode == ThemeMode.light
                          ? 'assets/images/body of seb7a.png'
                          : 'assets/images/body of seb7a dark(1).png',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Image.asset(
                  vm.currentThemeMode == ThemeMode.light
                      ? 'assets/images/head of seb7a.png'
                      : 'assets/images/head of seb7a dark(1).png',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'عدد التسبيحات',
            style: TextStyle(
              fontFamily: 'El Messiri',
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 81,
            width: 69,
            decoration: BoxDecoration(
              color: vm.currentThemeMode == ThemeMode.light
                  ? kPrimaryColorLightTheme
                  : kPrimaryColorDarkTheme,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                counter.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 51,
            width: 137,
            decoration: BoxDecoration(
              color: vm.currentThemeMode == ThemeMode.light
                  ? kPrimaryColorLightTheme
                  : kSecondColorDarkTheme,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(text,
                textAlign: TextAlign.center,
                style: vm.currentThemeMode == ThemeMode.light
                    ? const TextStyle(color: Colors.white)
                    : const TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  onMasbahaClicked() {
    setState(() {});
    if (counter == 0 || counter < 33) {
      _rotationAngle += 135;
      counter++;
    } else {
      if (azkarList.isEmpty) return;
      counter = 0;
      currentIndex++;
    }
    if (currentIndex >= azkarList.length) {
      currentIndex = 0; // Reset to the beginning if at the end
    }
    text = azkarList[currentIndex];
  }
}
