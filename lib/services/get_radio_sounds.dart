import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami_app/models/radio_model.dart';

class GetRadioSounds {
  Future getUrl() async {
    http.Response response = await http
        .get(Uri.parse('https://api.mp3quran.net/radios/radio_arabic.json'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData =
          jsonDecode(response.body); // the total body
      List<dynamic> radiosList = jsonData['radios'];
      List<RadioModel> radioModelList = [];
      for (var radio in radiosList) {
        RadioModel radioModel = RadioModel.fromJson(radio);
        radioModelList.add(radioModel);
      }

      return radioModelList;
    } else {
      throw Exception(
          'there is a problem in status code ${response.statusCode}');
    }
  }
}
