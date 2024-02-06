import 'package:flutter/material.dart';
import 'package:islami_app/constants.dart';

class QuranListTitle extends StatelessWidget {
  final String suraName;
  final String suraNumber;

  const QuranListTitle({
    super.key,
    required this.suraName,
    required this.suraNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            suraNumber,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'El Messiri',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          height: 45,
          width: 2,
          color: kPrimaryColor,
        ),
        Expanded(
          child: Text(
            suraName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'El Messiri',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
