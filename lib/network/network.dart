import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/util/forecast_util.dart';

class Network {
  Future<WeatherForecastModel>? getWeatherForecast({String? cityName}) async {
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast?q=" +
        cityName! +
        "&appid=" +
        Util.appId +
        " &units=metric";
    final response = await get(Uri.parse(finalUrl));
    print("Url:${Uri.encodeFull(finalUrl)}");
    if (response.statusCode == 200) {
      print("weather data:${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting weather forecast");
    }
  }
}
