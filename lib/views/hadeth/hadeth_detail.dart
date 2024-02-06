import 'package:flutter/material.dart';
import 'package:islami_app/constants.dart';
import 'package:islami_app/models/hadeth_content_model.dart';

class HadethDetail extends StatelessWidget {
  const HadethDetail({super.key});

  static const String routeName = 'hadethDetail';

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments as HadethModel;
    Size mediaQuery = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/main_background.png'),
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
            color: Colors.white.withOpacity(.8),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Text(
                arguments.title,
                style: const TextStyle(
                  fontFamily: 'El Messiri',
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Divider(
                color: kPrimaryColor,
              ),
              Expanded(
                child: Text(
                  arguments.hadethContent,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontFamily: 'El Messiri',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
