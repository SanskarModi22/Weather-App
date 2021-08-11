import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app/weather_forcast/model/Weather_Forecast_Model.dart';
import 'package:weather_app/weather_forcast/util/Weather_Util.dart';

class Network {
  Future<WeatherForecast> getWeather({String cityName}) async {
    String url = "https://api.openweathermap.org/data/2.5/forecast?q=" +
        cityName +
        "&appid=" +
        Util.appId +
        "&units=metric";
    final response = await get(Uri.parse(url));
    print("URL: ${Uri.parse(url)}");
    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(jsonDecode(response.body));
    } else
      throw Exception("Error getting Weather Forecast");
  }
}
