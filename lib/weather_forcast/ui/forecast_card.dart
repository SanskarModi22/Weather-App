import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/weather_forcast/model/Weather_Forecast_Model.dart';
import 'package:weather_app/weather_forcast/util/Icons.dart';
import 'package:weather_app/weather_forcast/util/Weather_Util.dart';

Widget ForecastCard(AsyncSnapshot<WeatherForecast> snapshot, int index) {
  var forcastlist = snapshot.data.list;
  var dayofWeek = "";
  var forca = forcastlist[index];
  var timeofday = forca.dtTxt.split(" ")[1];
  var dateTime = new DateTime.fromMillisecondsSinceEpoch(forca.dt * 1000);
  var fullDate = Util.getFormattedDate(dateTime);
  dayofWeek = fullDate.split(",")[0];
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(dayofWeek),
      Text(timeofday),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 40.0,
            child: Center(
              child: getWeatherIcon(
                weatherDescription: forca.weather[0].main,
                siz: 50,
                col: Colors.red,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${forca.main.temp.toStringAsFixed(0)}°C"),
                SizedBox(
                  width: 5.0,
                ),
                Text("${forca.weather[0].description.toUpperCase()}")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
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
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
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
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${forca.main.tempMax}°C"),
                      Icon(FontAwesomeIcons.temperatureHigh),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    ],
  );
}
