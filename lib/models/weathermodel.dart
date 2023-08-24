import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'dart:convert';

class WeatherModel {

  String apiKey = dotenv.get('OPEN_WEATHER_MAP_API_KEY',fallback: 'OPEN WEATHER MAP API KEY NOT FOUND');

  Future<dynamic>getWeatherDetails() async{
    Position position = await Geolocator.getCurrentPosition();
    double latitude = position.latitude;
    double longitude = position.longitude;
    var response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric"));
    Map data = jsonDecode(response.body);
    return data;
  }

  Future<dynamic> getByCity(city) async{
    var response = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric"));
    Map data = jsonDecode(response.body);
    return data;
  }
}