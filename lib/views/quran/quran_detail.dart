import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/constants.dart';
import 'package:islami_app/models/sura_content_model.dart';

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

    if (versesList.isEmpty) loadData(arguments.suraNumber);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/main_background.png',
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
              color: const Color(0xffF8F8F8).withOpacity(.8),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'سورة ${arguments.suraName}',
                      style: const TextStyle(
                        fontSize: 25,
                        fontFamily: 'El Messiri',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Icon(
                      Icons.play_circle_fill_outlined,
                      size: 28,
                    ),
                  ],
                ),
                const Divider(
                  color: kPrimaryColor,
                ),
                if (versesList.isEmpty)
                  const Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  ),
                if (versesList.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Text(
                          '${{index + 1}} ${versesList[index]}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'El Messiri',
                          ),
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
