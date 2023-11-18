import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  //='0e42eac3e750d240d274ec0021553be0';
  WeatherService(this.apiKey);

  Future<Weather> getWeather(String cityName) async {
    // final response =
    //     await http.get(Uri.parse('$BASE_URL?q=dhaka&appid=$apiKey'));

    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=dhaka&appid=0e42eac3e750d240d274ec0021553be0&units=metric'));
    if (response.statusCode == 200) {
      print(response.body);
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    String? city = placemarks[0].locality;
    return city ?? "";
  }
}
