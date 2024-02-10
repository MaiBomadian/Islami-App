import 'package:flutter/material.dart';
import 'package:islami_app/constants.dart';

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
    Size mediaQuery = MediaQuery.of(context).size;
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
                      'assets/images/body of seb7a.png',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Image.asset('assets/images/head of seb7a.png'),
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
              color: const Color(0xffc9b396),
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
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Inter',
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  onMasbahaClicked() {
    setState(() {

    });
    if (counter == 0 || counter <33) {
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
