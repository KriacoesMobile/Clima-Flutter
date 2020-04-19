import 'package:clima/screens/error_screen.dart';
import 'package:clima/screens/weather_information.dart';
import 'package:clima/services/weather_data.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  void getWeatherData() async {
    var weatherData = await WeatherData().getLocationData();

    if (weatherData != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return WeatherInformation(weatherData: weatherData);
      }));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return ErrorScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/launcher/foreground.png',
              scale: 6.0,
            ),
            SizedBox(height: 10.0),
            Text(
              'Clima',
              style: kRegularTextStyle.copyWith(
                fontSize: 60.0,
                color: kPrimaryFontColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
