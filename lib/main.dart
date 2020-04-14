import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/weather_information.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        backgroundColor: kBackgroundColor,
      ),
      home: WeatherInformation(),
    );
  }
}
