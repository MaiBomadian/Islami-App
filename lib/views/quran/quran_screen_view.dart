import 'package:flutter/material.dart';
import 'package:islami_app/constants.dart';
import 'package:islami_app/models/sura_content_model.dart';
import 'package:islami_app/views/quran/quran_detail.dart';
import 'package:islami_app/views/quran/quran_list.dart';

class QuranScreen extends StatelessWidget {
  final List<String> suraNameList = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.asset(
          'assets/images/mushaf.png',
          height: mediaQuery.height * .2,
        ),
        const Divider(
          color: kPrimaryColor,
          thickness: 2,
        ),
        Row(
          children: [
            const Expanded(
              child: Text(
                'رقم السورة',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontFamily: 'El Messiri'),
              ),
            ),
            Container(
              height: 35,
              width: 2,
              color: kPrimaryColor,
            ),
            const Expanded(
              child: Text(
                'اسم السورة',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontFamily: 'El Messiri'),
              ),
            ),
          ],
        ),
        const Divider(
          color: kPrimaryColor,
          thickness: 2,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: ((context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, QuranDetail.routeName,
                        arguments: SuraContent(
                          suraNameList[index],
                          (index + 1).toString(),
                        ));
                  },
                  child: QuranListTitle(
                    suraName: suraNameList[index],
                    suraNumber: (index + 1).toString(),
                  ),
                )),
            itemCount: suraNameList.length,
          ),
        ),
      ],
    );
  }
}
