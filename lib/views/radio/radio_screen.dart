import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/constants.dart';
import 'package:islami_app/services/get_radio_sounds.dart';
import 'package:provider/provider.dart';

import '../../config/settings_provider.dart';
import '../../models/radio_model.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({
    super.key,
  });

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  List<RadioModel> radioModelList = [];
  AudioPlayer audioPlayer = AudioPlayer();
  int currentIndex = 0;
  bool isPlay = false;

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/radio_header.png',
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'إذاعة القرآن الكريم',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'El Messiri',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                // Play the previous audio when the user taps the skip previous button
                if (radioModelList.isNotEmpty) {
                  currentIndex = (currentIndex - 1 + radioModelList.length) %
                      radioModelList.length;
                  await playAudio(currentIndex);
                }
              },
              child: Icon(
                Icons.skip_previous,
                color: vm.currentThemeMode == ThemeMode.light
                    ? kPrimaryColorLightTheme
                    : kSecondColorDarkTheme,
                size: 50,
              ),
            ),
            GestureDetector(
              onTap: () async {
                try {
                  List<RadioModel> newList = await GetRadioSounds().getUrl();
                  setState(() {
                    radioModelList = newList;
                    currentIndex = 0;
                    log(radioModelList.toString());
                  });
                  if (radioModelList.isNotEmpty) {
                    await playAudio(currentIndex);
                  }

                  if (isPlay) {
                    await audioPlayer.pause();
                  } else {
                    await playAudio(currentIndex);
                  }

                  setState(() {
                    isPlay = !isPlay;
                  });
                } catch (e) {
                  print(e.toString());
                }
              },
              child: Icon(
                isPlay ? Icons.pause : Icons.play_arrow,
                color: vm.currentThemeMode == ThemeMode.light
                    ? kPrimaryColorLightTheme
                    : kSecondColorDarkTheme,
                size: 50,
              ),
            ),
            GestureDetector(
              onTap: () async {
                // Play the next audio when the user taps the skip next button
                if (radioModelList.isNotEmpty) {
                  currentIndex = (currentIndex + 1) % radioModelList.length;
                  await playAudio(currentIndex);
                }
              },
              child: Icon(
                Icons.skip_next,
                color: vm.currentThemeMode == ThemeMode.light
                    ? kPrimaryColorLightTheme
                    : kSecondColorDarkTheme,
                size: 50,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> playAudio(int index) async {
    try {
      if (radioModelList.isNotEmpty) {
        String url = radioModelList[index].radioUrl;
        log('Playing audio from URL: $url');
        await audioPlayer.play(UrlSource(url));
        log('Audio playback successful.');
      }
    } catch (e) {
      print('Error playing audio: $e');
      throw Exception('Error playing audio: $e');
    }
  }

  @override
  void dispose() {
    // Dispose the audio player when the widget is disposed
    audioPlayer.dispose();
    super.dispose();
  }
}
