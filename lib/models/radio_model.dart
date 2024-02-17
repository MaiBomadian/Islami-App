class RadioModel {
  final String radioUrl;

  RadioModel({required this.radioUrl});

  factory RadioModel.fromJson(jsonData) {
    return RadioModel(radioUrl: jsonData['radio_url']);
  }
}
