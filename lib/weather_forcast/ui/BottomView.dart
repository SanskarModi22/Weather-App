import 'package:flutter/material.dart';
import 'package:weather_app/weather_forcast/model/Weather_Forecast_Model.dart';

import 'forecast_card.dart';

Widget bottom(AsyncSnapshot<WeatherForecast> snapshot, BuildContext context) {
  var forcastlist = snapshot.data.list;
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text("Weather for next Five Days"),
      Container(
        height: 170,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(width: 8.0),
          itemCount: forcastlist.length,
          itemBuilder: (context, index) => ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Container(
              // width:20,
              width: MediaQuery.of(context).size.width / 2.7,
              height: 160,
              child: ForecastCard(snapshot, index),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                gradient: LinearGradient(
                    colors: [Color(0xff9661C3), Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
            ),
          ),
        ),
      )
    ],
  );
}
