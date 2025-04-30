import 'dart:convert';

import '../Modal/modal.dart';
import 'package:http/http.dart' as http;

class WeatherServices {

  final String apiKey = '44435cbc42e93ff2b8e5203fd96b5c30';

  Future<Object> fetchWeather( String CityName) async {
    final url  = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$CityName&appid=$apiKey' );

    final response = await http.get(url);
    if(response.statusCode == 200){
      var jsonString = response.body;
      return Weather.fromJson(json.decode(response.body));
    } else {
      return[];
    }
  }
}