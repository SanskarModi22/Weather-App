import 'package:flutter/material.dart';
import 'package:weather_app/weather_forcast/network/Weather_Network.dart';
import 'package:weather_app/weather_forcast/ui/BottomView.dart';
import 'package:weather_app/weather_forcast/ui/mid_view.dart';

import 'model/Weather_Forecast_Model.dart';

class WeatherFore extends StatefulWidget {
  @override
  _WeatherForeState createState() => _WeatherForeState();
}

class _WeatherForeState extends State<WeatherFore> {
  Future<WeatherForecast> forecast;
  String _cityName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecast = WeatherNetwork();
    forecast.then((value) {
      print(value.city.coord.lat);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Weather"),
      //   centerTitle: true,
      // ),
      body: ListView(
        children: <Widget>[
          TextFieldView(),
          Container(
            child: FutureBuilder(
              future: forecast,
              builder: (BuildContext context,
                  AsyncSnapshot<WeatherForecast> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      MidView(snapshot),
                      bottom(snapshot, context),
                    ],
                  );
                } else
                  return Container(
                    child: Center(child: CircularProgressIndicator()),
                  );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget TextFieldView() {
    return Container(
      child: TextField(
        keyboardType: TextInputType.text,
        autofocus: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                  style: BorderStyle.solid, color: Colors.orangeAccent)),
          hintText: "City Name",
          prefixIcon: Icon(Icons.search_sharp),
        ),
        keyboardAppearance: Brightness.dark,
        onSubmitted: (value) {
          _cityName = value;
          setState(() {
            forecast = WeatherNetwork();
          });
        },
      ),
    );
  }

  Future<WeatherForecast> WeatherNetwork() =>
      Network().getWeather(cityName: _cityName);
}
