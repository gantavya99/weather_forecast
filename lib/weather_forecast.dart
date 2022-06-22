// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:weather_forecast/model/weather_forecast_model.dart';

import 'network/network.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel>? forecastObject;
  String _cityName = 'Mumbai';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = Network().getWeatherForecast(cityName: _cityName);
    forecastObject!.then((weather) => {print(weather.city)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        textFieldView(),
      ],
    ));
  }

  Widget textFieldView() {
    return Container(
        child: TextField(
      decoration: InputDecoration(
          hintText: 'Enter City Name !',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.all(8)),
    )
    );
  }
}
