import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_big_o_soft_demo/models/weather_model.dart';

class WeatherRepo{
  Future<WeatherModel> getWeather(String city) async{
    final result = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=fd85906aec4f55d97dfefaa997a4794e"));
    
    if(result.statusCode != 200)
      throw Exception();
    
    return parsedJson(result.body);
  }
  
  WeatherModel parsedJson(final response){
    final jsonDecoded = json.decode(response);

    final jsonWeather = jsonDecoded["main"];

    return WeatherModel.fromJson(jsonWeather);
  }
}