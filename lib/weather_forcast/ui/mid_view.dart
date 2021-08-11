import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/weather_forcast/model/Weather_Forecast_Model.dart';
import 'package:weather_app/weather_forcast/util/Icons.dart';
import 'package:weather_app/weather_forcast/util/Weather_Util.dart';

Widget MidView(AsyncSnapshot<WeatherForecast> snapshot) {
  var forcastlist = snapshot.data.list;
  var city = snapshot.data.city.name;
  var country = snapshot.data.city.country;
  var forca = forcastlist[0];
  var formattedDate = Util.getFormattedDate(
      new DateTime.fromMillisecondsSinceEpoch(forca.dt * 1000));
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("${city},${country}"),
        Text("${formattedDate}"),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: getWeatherIcon(
              weatherDescription: forca.weather[0].main,
              col: Colors.purpleAccent,
              siz: 200.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${forca.main.temp.toStringAsFixed(0)}°C"),
            SizedBox(
              width: 5.0,
            ),
            Text("${forca.weather[0].description.toUpperCase()}")
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("${forca.wind.speed}km/hr"),
                    Icon(FontAwesomeIcons.wind),
                  ],
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("${forca.main.humidity}%"),
                    Icon(FontAwesomeIcons.cloudRain),
                  ],
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("${forca.main.tempMax}°C"),
                    Icon(FontAwesomeIcons.temperatureHigh),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
