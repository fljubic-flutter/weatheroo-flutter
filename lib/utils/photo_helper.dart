// Singleton class
import 'package:http/http.dart' as http;
import 'package:weather_app/models/photo.dart';
import 'dart:async';
import 'package:weather_app/utils/constants.dart';
import 'dart:convert';

class PhotoHelper {
  PhotoHelper._privateConstructor();
  int hits = 0;

  static final _instance = PhotoHelper._privateConstructor();

  static PhotoHelper get instance => _instance;

  Future<Photo> getPhoto(String query) async {
    http.Response response = await http.get(
        'https://pixabay.com/api/?key=$pixabayAPI&q=$query&image_type=photo&orientation=vertical&category=buildings');

    if (response.statusCode == 200) {
      Photo photo = Photo.fromJson(json.decode(response.body)['hits'][0]);
      print(photo.largeImageUrl);
      return photo;
    } else {
      throw Exception("Error getting image!");
    }
  }
}
