import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getWeatherIcon({String weatherDescription, Color col, double siz}) {
  switch (weatherDescription) {
    case 'Clear':
      {
        return Icon(
          FontAwesomeIcons.sun,
          color: col,
          size: siz,
        );
      }
    case 'Rain':
      {
        return Icon(
          FontAwesomeIcons.cloudRain,
          color: col,
          size: siz,
        );
      }
    case 'Clouds':
      {
        return Icon(
          FontAwesomeIcons.cloud,
          color: col,
          size: siz,
        );
      }
    case 'Snow':
      {
        return Icon(
          FontAwesomeIcons.snowflake,
          color: col,
          size: siz,
        );
      }
  }
}
