import 'package:clima/screens/loading_screen.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: LoadingScreen(),
    );
  }
}
